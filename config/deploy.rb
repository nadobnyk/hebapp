require 'bundler/capistrano'

set :application, "hebapp"

role :web, "ec2-54-244-70-161.us-west-2.compute.amazonaws.com"
role :app, "ec2-54-244-70-161.us-west-2.compute.amazonaws.com"
role :db,  "ec2-54-244-70-161.us-west-2.compute.amazonaws.com", primary: true

set :repository,  '.'
set :scm, :none
set :deploy_via, :copy

set :user, "ubuntu"
set :deploy_via, :remote_cache
set :deploy_to, "/home/hebapp/application"
set :use_sudo, true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :ssh_options, {:auth_methods => "publickey"}
set :ssh_options, {:keys => ["/home/konrad/Key.pem"]}

# necessary?
after 'deploy:update_code', 'deploy:migrate'
after "deploy:restart", "deploy:cleanup"
