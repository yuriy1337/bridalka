class ContactRequest < ActiveRecord::Base
  validates :first_name,    :presence => true
  validates :message,    :presence => true
end
