class Note < ApplicationRecord 
    #attr_accesible :image, :reference
    mount_uploader :image, ImageUploader
    attr_accessor :remote_image_url
    has_many :image
   # has_many_attached :image as :imageable do |attachable|
   #     attachable.variant :thumb, resize_to_limit: [100, 100]
   # end 
    #after_save :save_picture 
end               

