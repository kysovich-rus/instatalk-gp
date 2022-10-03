# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "instatalk"
set :repo_url, "git@github.com:kysovich-rus/instatalk-gp.git"
set :branch, ENV['BRANCH'] if ENV['BRANCH']

set :deploy_to, "/home/deploy/apps/instatalk"

after "deploy:restart", "resque:restart"

append :linked_files, "config/database.yml", 'config/secrets.yml', '.env'

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"
