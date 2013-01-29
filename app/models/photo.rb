class Photo < ActiveRecord::Base
  belongs_to :gallery, :inverse_of => :photos
  attr_accessible :id, :gallery_id, :image
  mount_uploader :image, ImageUploader

  after_destroy :remove_directory
  
  def remove_directory
    puts "11111111111111111111111111111111111111111111"
    puts ImageUploader.store_dir.to_s
    puts "11111111111111111111111111111111111111111111"
    #store_dir = file.store_dir
    #remove_generic_image!
    #FileUtils.remove_dir("#{Rails.root}/#{store_dir}", :force => true)
  end

end
