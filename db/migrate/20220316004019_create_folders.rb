class CreateFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :folders do |t|
      t.integer :folder_id
      t.text :name

      t.timestamps
    end
  end
end
