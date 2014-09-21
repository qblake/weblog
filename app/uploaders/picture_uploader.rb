# encoding: utf-8

class PictureUploader < ApplicationUploader
  process :resize_to_fit => [300, 300]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [100, 100]
  end

end
