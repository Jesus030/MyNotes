class Collection < ApplicationRecord
  #belongs_to :user
  #has_many :notes, through: :notes
  has_many :notes
  attr_accessor :user_id, :notes_id
  #has_many :notes, dependent: :destroy
end
