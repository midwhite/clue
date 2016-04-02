class AddAttachmentIdentificationImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :identification_image
    end
  end

  def self.down
    remove_attachment :users, :identification_image
  end
end
