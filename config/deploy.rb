require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano/sidekiq'

default_run_options[:pty] = true
set :keep_releases, 5
set :application, "Amazing Boneo"
set :repository,  "git@gitlab.projectwebby.com:rubifytechnology/amazing-boneo.git"
set :scm, :git
set :rake,  "bundle exec rake"
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :use_sudo,	false
set :deploy_via, :remote_cache
set :rake,  "bundle exec rake"

load 'deploy/assets'

after 'deploy:finalize_update', 'deploy:symlink_share', 'deploy:generate_binstubs'
after "deploy:update", "deploy:cleanup"

def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end

namespace :deploy do
  desc "Zero-downtime restart of Unicorn"
  task :force_restart, roles: :app do
    # run "service unicorn upgrade"
    if remote_file_exists?("#{shared_path}/pids/boneo.pid")
      run "kill -s QUIT `cat #{shared_path}/pids/boneo.pid`"
    end
    sleep(3)
    run "cd #{current_path} ; bundle exec unicorn -c config/unicorn.rb -D -E #{rails_env}"
  end

  task :restart, roles: :app do
    if remote_file_exists?("#{shared_path}/pids/boneo.pid")
      run "kill -s USR2 `cat #{shared_path}/pids/boneo.pid`"
    else
      run "cd #{current_path} ; bundle exec unicorn -c config/unicorn.rb -D -E #{rails_env}"
    end
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true }, roles: :app  do
    run "cd #{current_path} ; bundle exec unicorn -c config/unicorn.rb -D -E #{rails_env}"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true }, roles: :app  do
    run "kill -s QUIT `cat #{shared_path}/pids/boneo.pid`"
  end

  desc 'migrate database'
  task :generate_binstubs, roles: [:app, :db] do
    begin
      run "cd #{release_path} && RAILS_ENV=#{rails_env} #{rake} db:migrate"
    rescue => e
    end
  end

  namespace :assets do
    task :link_tmp_cache_folder, roles: [:app, :db] do
      run "mkdir -p #{shared_path}/tmp/cache"
      run "mkdir -p #{release_path}/tmp"
      run "ln -nfs #{shared_path}/tmp/cache #{release_path}/tmp/cache"
    end
  end

  desc 'Symlink share'
  task :symlink_share, roles: [:app, :db] do
    ## Link System folder
    run "mkdir -p #{shared_path}/system"
    run "ln -nfs #{shared_path}/system #{release_path}/public/system"

    run "mkdir -p #{shared_path}/build"
    run "ln -nfs #{shared_path}/build #{release_path}/public/build"

    ## Link Database file
    run "rm -f #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"

    ## Link config file
    run "rm -f #{release_path}/config/config.yml"
    run "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"

    ## Link config file
    run "rm -f #{release_path}/.rbenv-vars"
    run "ln -nfs #{shared_path}/.rbenv-vars #{release_path}/.rbenv-vars"


  end

  namespace :web do
    desc "Present a maintenance page to visitors."
    task :disable, :roles => :app, :except => { :no_release => true } do
      require 'erb'
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }

      reason = ENV['REASON']
      deadline = ENV['UNTIL']

      template = File.read("./app/views/layouts/maintenance.html.erb")
      result = ERB.new(template).result(binding)

      put result, "#{shared_path}/system/maintenance.html", :mode => 0644
    end

    desc "Disable maintenance mode"
    task :enable, :roles => :app do
      run "rm -f #{shared_path}/system/maintenance.html"
    end
  end
end
