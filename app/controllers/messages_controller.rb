class MessagesController < ApplicationController
  before_action :authenticate_user!, :full_profile
  before_action :redirect_to_index, only: :show

  add_breadcrumb 'TOP', :root_path

  def index
    @inbox = Message.where(receiver_id: current_user.id, sent: 1)
                    .order(updated_at: :desc)
    @inbox_users = Message.where(receiver_id: current_user.id, sent: 1)
                        .order(updated_at: :desc).select(:sender_id).uniq
    @outbox = Message.where(sender_id: current_user.id)
                      .order(updated_at: :desc)
    @outbox_users = Message.where(sender_id: current_user.id)
                        .order(updated_at: :desc).select(:receiver_id).uniq
      
    add_breadcrumb 'メッセージボックス', messages_path
  end

  def show
    add_breadcrumb 'ダイアリーを読む', diaries_path
    @message = Message.find(params[:id])
    @sender = @message.sender
    @receiver = @message.receiver
    @offer = @message.offer
    @ticket = @offer.ticket if @offer
    @user = @ticket.user  if @ticket
    @status = ['調整中','確定待ち','確定済み']
    @messages = show_past_messages
    
#    if @message.receiver_id == current_user.id
#      @message.update(opened: 1)
#    end
    add_breadcrumb 'メッセージボックス', messages_path
    add_breadcrumb 'メッセージ'
  end

  def new
    @message = Message.new
    @message.receiver_id = params[:receiver_id] 
    @receiver = User.find(params[:receiver_id])
    @messages = new_past_messages(params[:receiver_id])
    
    @messages.each do | past_message |
      if past_message.receiver_id == current_user.id && past_message.opened.blank?
        past_message.update(opened: 1)
      end
    end
    
    # 未読件数をアップデート
    unread_message_count
    
    add_breadcrumb 'メッセージボックス', messages_path
    add_breadcrumb '新規作成'
  end

  def create
    @message = Message.create(submit_params)
    @new_message = Message.new
    @new_message.receiver_id = @message.receiver_id
    @messages = new_past_messages(@message.receiver_id)
  end

  def destroy
    @message = Message.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def submit_params
    params.require('message').permit(:sender_id, :receiver_id, :title, :message, :sent, :offer_id)
  end

  def new_past_messages(other_user_id)
    Message.where("receiver_id = ? or sender_id = ?", current_user.id, current_user.id).where("receiver_id = ? or sender_id = ?", other_user_id, other_user_id).order(id: :desc)
  end

  def show_past_messages
    messages = Message.all
    if @message.receiver_id == current_user.id
      messages.where("receiver_id = ? or sender_id = ?", current_user.id, current_user.id).where("receiver_id = ? or sender_id = ?", messages.find(params[:id]).sender_id, messages.find(params[:id]).sender_id).order(id: :desc)
    else
      messages.where("receiver_id = ? or sender_id = ?", current_user.id, current_user.id).where("receiver_id = ? or sender_id = ?", messages.find(params[:id]).receiver_id, messages.find(params[:id]).receiver_id).order(id: :desc)
    end
  end

  def redirect_to_index
    @message = Message.find(params[:id])
    unless current_user.id == @message.sender_id || current_user.id == @message.receiver_id
      redirect_to action: :index
    end
  end
end