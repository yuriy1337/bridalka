require "bundler/capistrano"
require "rvm/capistrano"

default_run_options[:pty] = true 

#Setup the server details
set :domain, "bridalkaleidoscope.com"
set :application, "Bridalka"

#Setup the user details. Will be prompted for password
set :user, Capistrano::CLI.ui.ask("Username: ")
set :use_sudo, true
set :deploy_to, "~/bridalka/apps/bridalka"

#Setup SCM details.
set :scm, :git
set :branch, 'master'
set :repository,  "git@github.com:yuriy1337/brikalka.git"
set :deploy_via, :remote_cache

#rvm options
set :rvm_ruby_string, 'ruby-1.9.3-p194' # Defaults to 'default'
set :rvm_type, :system
set :rvm_install_type, :stable
set :rvm_install_with_sudo, true

#before 'deploy:setup', 'rvm:install_rvm'	#automatically install rvm
#before 'deploy', 'rvm:install_rvm'	#update rvm each time

#use system rvm


#before 'deploy:setup', 'rvm:install_ruby'

role :web, domain   # Your HTTP server, Apache/etc
role :app, domain   # This may be the same as your `Web` server
role :db,  "mysql.bridalkaleidoscope.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  
  namespace :assets do
  task :precompile, :roles => :web, :except => { :no_release => true } do
    from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else  
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
end
  
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
 
after :deploy, "passenger:restart"