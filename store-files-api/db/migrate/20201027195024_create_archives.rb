class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :name
      t.references :directory, foreign_key: true

      t.timestamps
    end
  end
end
