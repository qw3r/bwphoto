class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :camera, type: String
  field :author, type: String

end