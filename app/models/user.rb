class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends,  :through => :inverse_friendships, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 # enum role:[:user, :admin]
def pending_friends
inverse_friendships.pending.map(&:user)
end
 def admin?
  self.role == "admin"
end

def user?
  self.role == "user"
end

 after_initialize :set_default_role, :if => :new_record?

 def set_default_role
  self.role ||= :user
 end

def add_friend(friend)
  friends << friend
end

def remove_friend(friend)
  friendship= friendships.find_by(friend_id: friend.id)
  friendship.destroy if friendship
end
end
