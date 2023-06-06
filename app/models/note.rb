class Note < ApplicationRecord 
    belongs_to :User
    #belongs_to :collection_note
    mount_uploader :image, ImageUploader
    attr_accessor :remote_image_url
    #attr_accessor :user_id
    has_many :image
   # has_many_attached :image as :imageable do |attachable|
   #     attachable.variant :thumb, resize_to_limit: [100, 100]
   # end 
end               

