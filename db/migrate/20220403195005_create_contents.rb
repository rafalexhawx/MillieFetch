class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.text :content_path
      t.references :folder, null: false, foreign_key: true
      t.references :metadatum, null: false, foreign_key: true
      t.timestamps
    end
  end
end
