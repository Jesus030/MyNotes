class CollectionNote < ApplicationRecord
  belongs_to :user
  has_many :notes
  attr_accessor :user_id, :notes_id
end
