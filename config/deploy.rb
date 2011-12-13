set :application, "wordpower"
set :repository,  "git@github.com:wangsy/wordpower.git"

$:.unshift(File.expand_path('./lib',ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2'
set :rvm_type, :user

set :scm, :git
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "mintech.iptime.org"                          # Your HTTP server, Apache/etc
role :app, "mintech.iptime.org"                          # This may be the same as your `Web` server
role :db,  "mintech.iptime.org", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  
  desc "cause Passenger to initiate a restart"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

after "deploy:update_code", :bundle_install
desc "install the ncessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end