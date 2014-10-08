#encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:

  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper


  include CarrierWave::MimeTypes
  process :set_content_type
end
