class ContactRequest < ActiveRecord::Base
  validates :first_name,    :presence => true
  validates :message,    :presence => true
  #validates(:email,
  #         :presence   => {:message => "can't be blank"},
  #         :email      => {:message => 'must be valid'})

  validates :email, :presence => true
  validates :email, :format => { :with => EmailAddressValidation::PatternExact }, if: "!email.blank?"


  validates_as_phone_number :phone_number, :message => 'is invalid', :allow_nil => true, :multiline => true

end
