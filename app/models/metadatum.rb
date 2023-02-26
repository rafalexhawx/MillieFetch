class Metadatum < ApplicationRecord
    belongs_to :folder
    has_many :contents
end
