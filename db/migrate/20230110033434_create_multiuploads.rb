class CreateMultiuploads < ActiveRecord::Migration[7.0]
  def change
    create_table :multiuploads do |t|
      t.text :path
      t.text :series
      t.text :subseries
      t.text :local_id
      t.text :status
      t.text :record_collection
      t.text :office_origin
      t.text :box_type
      t.integer :box_number
      t.timestamps
    end
  end
end
