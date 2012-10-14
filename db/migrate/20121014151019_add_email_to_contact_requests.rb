class AddEmailToContactRequests < ActiveRecord::Migration
  def change
    add_column :contact_requests, :email, :string
  end
end
