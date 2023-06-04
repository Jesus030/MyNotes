class CollectionNote < ApplicationRecord
    belongs_to :user
  belongs_to :notes
  attr_accessible :user_id, :notes_id
end
