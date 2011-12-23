class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :zip_code
      t.date :wedding_date
      t.string :wedding_location
      t.string :ceremony_venue
      t.string :reception_venue
      t.string :referent
      t.string :referent_name
      t.text :message

      t.timestamps
    end
  end
end
