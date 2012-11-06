class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :camera, type: String
  field :author, type: String

  # attr_accessible :title, :camera, :author, :avatar, :avatar_cache
  attr_accessor :file

  mount_uploader :image, PhotoUploader

  validates :title, :camera, :author, presence: true

  before_validation :setup_image


  private

  def setup_image
    return errors.add(:file, "can't be blank") if file.blank?
    if file =~ %r{\Ahttps?://}i
      self.remote_image_url = file
    end
  end
end