class Note < ApplicationRecord
    #attr_accesible :picture, :reference
    mount_uploader :image, ImageUploader
    attr_accessor :remote_image_url
    # has_one_attached :picture
   # has_many_attached :picture as :imageable do |attachable|
   #     attachable.variant :thumb, resize_to_limit: [100, 100]
   # end 
    #after_save :save_picture 
end               

