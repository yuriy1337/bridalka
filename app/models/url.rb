class Url < ActiveRecord::Base
  attr_accessible :name, :address, :thumbnail
  belongs_to :gallery, :inverse_of => :urls
  
end
