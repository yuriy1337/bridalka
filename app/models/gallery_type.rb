class GalleryType < ActiveRecord::Base
  has_many :gallery, :inverse_of => :gallery_type
  #attr_accessible :id, :name
  validates_uniqueness_of :name, :case_sensitive => false
end
