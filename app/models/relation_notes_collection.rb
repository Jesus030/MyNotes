class RelationNotesCollection < ApplicationRecord
  belongs_to :note
  belongs_to :user
end
