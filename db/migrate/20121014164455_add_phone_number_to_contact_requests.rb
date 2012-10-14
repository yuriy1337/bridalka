class AddPhoneNumberToContactRequests < ActiveRecord::Migration
  def change
    add_column :contact_requests, :phone_number, :string
  end
end
