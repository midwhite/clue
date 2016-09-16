class Diary < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def post_date
    self.created_at.strftime("%Y年%m月%d日 %H時%M分")
  end

  def self.search_params(key, params)
    if params.present?
      if key == 'user_id'
        where(user_id: params)
      else
        where("#{key} like ?", "%#{params}%")
      end
    else
      order(updated_at: :desc)
    end
  end
end
