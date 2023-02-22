class Multiupload < ApplicationRecord
    has_many_attached :library_files, service: :local
end