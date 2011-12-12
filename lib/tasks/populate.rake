namespace :db do
  
  desc "Erase and fill database"
  
  task :populate => :environment do
    p = PackageType.new(:name => 'Photo')
    p.save
    p = PackageType.new(:name => 'Video')
    p.save
  end
  
end