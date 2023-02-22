class Upload < ApplicationRecord
    #mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    has_one_attached :attachment, service: :local
    validates :folder_title, presence: true # Make sure the folder_title is present.
    validates :FOIA_ID, presence: true   # Make sure the foia_id  is present.
    validates :local_id, presence: true # Make sure the local_id is present. 
    validates :status, presence: true # Make sure the status is present. 
    validates :record_collection, presence: true # Make sure the record_collection  is present. 
    validates :office_origin, presence: true # Make sure the office_origin  is present. 
    validates :series, presence: true # Make sure the series is present. 
    validates :subseries, presence: true # Make sure the subseries  is present. 
    validates :box_type, presence: true # Make sure the box_type  is present. 
    validates :box_number, presence: true # Make sure the box_number is present.  
    validates :note_field, presence: true # Make sure the notefield is present. 
end 