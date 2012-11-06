class PhotoUploader < CarrierWave::Uploader::Base
  storage :grid_fs
end