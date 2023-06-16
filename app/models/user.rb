class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends,  :through => :inverse_friendships, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes, dependent: :destroy
  has_many :colecciones, dependent: :destroy
  attr_accessor :notes_id
  before_create :generate_authentication_token
  
  attr_accessor :authentication_token
#  before_save :ensure_authentication_token
#  before_create :generate_token


 # enum role:[:user, :admin]
def pending_friends
  inverse_friendships.pending.map(&:user)
end
def all_friends
    friends + inverse_friends  
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



def generate_token
  self.token =SecureRandom.hex(16)
end
def generate_authentication_token
  self.authentication_token = SecureRandom.hex(20)
end 


end
