class CreateUploads < ActiveRecord::Migration[7.0]
    def change
      create_table :uploads do |t|
        t.integer :FOIA_ID
        t.text :folder_title
        t.text :local_id
        t.text :status
        t.text :record_collection
        t.text :office_origin
        t.text :series
        t.text :subseries
        t.text :box_type
        t.integer :box_number
        t.text :note_field
        t.string :attachment
  
        t.timestamps
      end
    end
  end