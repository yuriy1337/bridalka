class Gallery < ActiveRecord::Base
  has_many :photos, :inverse_of => :gallery, :dependent => :destroy
end
