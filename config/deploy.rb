require "bundler/capistrano"
require "rvm/capistrano"

Setup the server details
set :domain, "bridalka.dreamhosters.com"
set :application, "Bridalka"

#Setup SCM details.
set :scm, :git
set :branch, 'master'
set :repository,  "git@github.com:yuriy1337/brikalka.git"
set :deploy_via, :remote_cache

#set ruby string - not sure if necessayry
set :rvm_ruby_string, 'ree@rails3'

#use system rvm
set :rvm_type, :system  # Copy the exact line. I really mean :system here

#which rvm to use
set :rvm_install_type, :stable

before 'deploy:setup', 'rvm:install_rvm'	#automatically install rvm
before 'deploy', 'rvm:install_rvm'	#update rvm each time

role :web, domain   # Your HTTP server, Apache/etc
role :app, domain   # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end