class Request < ActiveRecord::Base
  validates :first_name,    :presence => true
  validates(:email,
            :presence   => {:message => "Email can't be blank"},
            :email      => {:message => 'Email must be valid'})
  validates :zip_code,      :presence => true
  #validates :wedding_date,  :presence => true
  validates :referent,      :presence => true
end
