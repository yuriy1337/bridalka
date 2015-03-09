# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{deploy@example.com}
role :web, %w{deploy@example.com}
role :db,  %w{deploy@example.com}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }

##################
# Git setup
set :repository, "git@github.com:yuriy1337/bridalka.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache # faster than :copy
##################

#######
set :deploy_to, "/home/bridalka/apps"
set :rails_env, "production"
#######

set :user, 'bridalka'
set :ssh_options, { :forward_agent => true }

role :app, "bridalka.cloudapp.net"
role :web, "bridalka.cloudapp.net"
role :db, "bridalka.cloudapp.net", :primary => true

cap deploy:web:disable REASON="Website Upgrade" UNTIL="in a few minutes"

set :keep_releases, 10
default_run_options[:pty] = true
#server "bridalka.cloudapp.net", :app, :web, :db, :primary => true

# namespace :deploy do
#     desc "Restarting mod_rails with restart.txt"
#         task :restart, :roles => :app, :except => { :no_release => true } do
#             run "touch #{current_path}/tmp/restart.txt"
#         end

#     [:start, :stop].each do |t|
#         desc "#{t} task is a no-op with mod_rails"
#         task t, :roles => :app do ; end
#     end
# end

# True by default but no longer necessary with asset pipeline
set :normalize_asset_timestamps, false

# Passenger!
set :passenger_port, 80
set :passenger_cmd, "rvmsudo passenger"

after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
after "deploy:finalize_update", "deploy:symlink_configs", "deploy:symlink_custom"

namespace :deploy do
# Only precompile the assets that need it
    namespace :assets do
        task :precompile, :roles => :web, :except => { :no_release => true } do
            from = source.next_revision(current_revision)
            if releases.length <= 1 || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
                run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
            else
                logger.info "Skipping asset pre-compilation because there were no asset changes"
            end
        end
    end
end

desc "Start passenger standalone on port #{passenger_port}"
    task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{passenger_cmd} start -e #{rails_env} -p #{passenger_port} -d"
end

desc "Stop passenger standalone on port #{passenger_port}"
    task :stop, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{passenger_cmd} stop -p #{passenger_port}"
end

desc "Restart Passenger standalone on port #{passenger_port}"
    task :restart, :roles => :app, :except => { :no_release => true } do
        run <<-CMD
        #{try_sudo} whoami;
        if [[ -f #{deploy_to}/#{shared_dir}/tmp/pids/passenger.#{passenger_port}.pid ]];
        then
        cd #{current_path} && #{passenger_cmd} stop -p #{passenger_port};
        fi
        CMD
        run <<-CMD
        #{try_sudo} whoami;
        cd #{current_path} && #{passenger_cmd} start -e #{rails_env} -p #{passenger_port} -d --user=#{user};
        CMD
    end
end

cap deploy:web:enable