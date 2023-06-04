class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => 'User'

    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
    scope:pending, -> {where(status:"pending")}
end
