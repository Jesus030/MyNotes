class Note < ApplicationRecord
    attr_accesible :picture, :reference

    after_save :save_picture


    def picture=(file_data)
        unless file_data.blank?
            @file_data = file_data
            self.extension = file_data.original_filename.split('.').last.downcase



        end
    end

    private

    def save_picture
        if @file_data
            FileUtils.mkdir_p PICTURES
            File.open(picture:filename, 'wb') do |f|
                f.write(@file_data.read)
            end 
        end
    end           
end    

