class Gallery < ActiveRecord::Base
  has_many :photos, :inverse_of => :gallery, :dependent => :destroy
  has_many :urls, :inverse_of => :gallery, :dependent => :destroy
  belongs_to :gallery_type, :inverse_of => :gallery
  #attr_accessible :id, :name, :description, :type, :gallery_type_id
  #accepts_nested_attributes_for :photos, :allow_destroy => true
end
