server "128.199.92.235", :app, :web, :db, :primary => true
set :rails_env, "staging"
set :user, 'app'
set :branch, :master
set :deploy_to, "/home/app/www/boneo"

default_run_options[:pty] = true
set :default_environment, {
  'PATH' => "/home/app/.rbenv/shims:/home/app/.rbenv/bin:$PATH"
}