class Gallery < ActiveRecord::Base
  has_many :photos, :inverse_of => :gallery, :dependent => :destroy
  has_many :urls, :inverse_of => :gallery, :dependent => :destroy
end
