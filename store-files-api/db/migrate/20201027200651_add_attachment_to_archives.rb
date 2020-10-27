class AddAttachmentToArchives < ActiveRecord::Migration[5.1]
  def change
    add_column :archives, :attachment, :string
  end
end
