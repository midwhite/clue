class Managers::ReportsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :before_manager_action

  add_breadcrumb '管理トップ', :managers_index_path
  add_breadcrumb '通報アカウント管理', nil, :only => [:index, :search]

  def index
    @reports = ReportedAccount
    @q = User.where('reported >= ?', 1)
      .order(reported: :desc)
      .search
    @users = @q.result
  end

  def search
    @reports = ReportedAccount
    @q = User.where('reported >= ?', 1)
      .order(reported: :desc)
      .search(search_params)
    @users = @q.result
    render "shared/search"
  end

  private

  def search_params
    search_conditions = %w(username_cont s)
    params.require(:q).permit(search_conditions)
  end

end
