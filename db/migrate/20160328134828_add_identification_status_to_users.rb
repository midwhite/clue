class AddIdentificationStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identification_status, :integer, default: 0, null: false
  end
end
