class Photo < ActiveRecord::Base
  has_one :gallery
  attr_accessible :gallery_id, :image
  mount_uploader :image, ImageUploader
end
