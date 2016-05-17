class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  if ENV['S3_KEY']
    storage :fog

    def cache_dir
      "#{Rails.root.to_s}/tmp/uploads" if ENV['HEROKU'] == 'true'
    end
  else
    storage :file
  end

  def store_dir
    ENV['STORAGE_PATH'] + "/files/#{model.album.path}"
  end

  # Create different versions of your uploaded files
  version :collection do
    process :resize_to_fill => [200, 200]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}"
    end
  end
  version :album do
    process :resize_to_fill => [100, 100]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}"
    end
  end
  version :preview do
    process :resize_to_fit => [210, 210]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}"
    end
  end
  version :single do
    process :resize_to_limit => [950, 950]

    def store_dir
      ENV['STORAGE_PATH'] + "/thumbs/#{model.album.path}"
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png bmp tiff)
  end


end
