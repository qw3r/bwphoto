class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :camera, type: String
  field :author, type: String

  # attr_accessible :title, :camera, :author, :avatar, :avatar_cache

  mount_uploader :image, PhotoUploader
end