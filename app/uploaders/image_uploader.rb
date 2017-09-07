class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # User can upload only files with these extensions
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Also ensure the file tipe, since a *.exe file
  # could be renamed to *.exe.jpeg
  def content_type_whitelist
    /image\//
  end
end
