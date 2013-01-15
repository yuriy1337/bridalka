class AddFileToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :file, :string
  end
end
