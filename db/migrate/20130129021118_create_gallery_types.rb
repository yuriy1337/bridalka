class CreateGalleryTypes < ActiveRecord::Migration
  def change
    create_table :gallery_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
