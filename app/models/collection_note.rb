class CollectionNote < ApplicationRecord
  belongs_to :user
  attr_accessor :user_id, :notes_id
  has_many :notes, through: :notes
end
