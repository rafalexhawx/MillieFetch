class CreateFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :folders do |t|
      t.text :folder_title

      t.timestamps
    end
  end
end
