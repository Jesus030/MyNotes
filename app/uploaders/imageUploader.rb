class ImageUploader < CarrierWave::Uploader::Base
storage :file

def store_dir
    "uploads/#{model.class.to_s.undercore}/#{mounerd_as}/#{model.id}"
end
def extension_white_list
    %w(jpg jpeg gif png)
  end
end