# Load DSL and Setup Up Stages
require 'capistrano/setup'

require 'rvm1/capistrano3'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }


##########
# Start
##########

before 'deploy', 'rvm1:install:rvm'  # install/update RVM

before 'deploy', cap rvm1:install:ruby

before 'deploy', 'rvm1:alias:create'

set :rvm1_alias_name, 'BridalKaleidoscopeApplication'

before 'deploy', 'rvm1:install:gems'  # install/update gems from Gemfile into gemset

load 'deploy/assets' # precompile assets