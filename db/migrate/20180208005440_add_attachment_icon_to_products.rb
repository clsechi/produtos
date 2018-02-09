class AddAttachmentIconToProducts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :products do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :products, :icon
  end
end
