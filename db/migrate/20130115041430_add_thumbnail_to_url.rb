class AddThumbnailToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :thumbnail, :string
  end
end
