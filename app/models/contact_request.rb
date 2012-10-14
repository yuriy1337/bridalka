class ContactRequest < ActiveRecord::Base
  validates :first_name,    :presence => true
  validates :message,    :presence => true
  validates(:email,
            :presence   => {:message => "can't be blank"},
            :email      => {:message => 'must be valid'})
end
