class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

mount_uploader :image, ImageUploader
 # enum role:[:user, :admin]

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
