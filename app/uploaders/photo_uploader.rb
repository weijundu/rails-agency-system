class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :thumbn do
    cloudinary_transformation width: 200, height: 200, crop: :thumb, gravity: :face
  end
  # Remove everything else
end
