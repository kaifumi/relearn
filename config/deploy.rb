lock "~> 3.13.0"

set :application, "relearn"
set :repo_url, "git@github.com:kaifumi/relearn.git"

set :deploy_to, "/home/ec2-user/relearn"
set :rbenv_ruby, '2.5.7'
set :linked_files, %w{config/master.key .env}
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

