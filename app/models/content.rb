class Content < ApplicationRecord
    belongs_to :folder
    belongs_to :metadatum
end
