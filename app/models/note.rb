class Note < ApplicationRecord
    #attr_accesible :picture, :reference
    has_one_attached :picture
    #after_save :save_picture 
end               

