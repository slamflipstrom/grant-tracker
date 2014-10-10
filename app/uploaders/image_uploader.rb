#encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  storage :fog

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick


  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper


  include CarrierWave::MimeTypes
  process :set_content_type
end