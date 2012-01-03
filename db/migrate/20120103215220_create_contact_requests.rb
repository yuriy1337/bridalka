class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :first_name
      t.string :last_name
      t.text :message

      t.timestamps
    end
  end
end
