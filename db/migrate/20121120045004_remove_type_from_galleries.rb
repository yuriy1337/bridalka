class RemoveTypeFromGalleries < ActiveRecord::Migration
  def up
    remove_column :galleries, :type
  end

  def down
    add_column :galleries, :type, :integer
  end
end
