class AddDirectoryIdToDirectories < ActiveRecord::Migration[5.1]
  def change
    add_column :directories, :directory_id, :integer
  end
end
