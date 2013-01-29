class AddTypeToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :gallery_type_id, :integer
  end
end
