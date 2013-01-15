class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.integer :gallery_id
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
