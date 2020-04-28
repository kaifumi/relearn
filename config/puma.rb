threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "development" }

pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

plugin :tmp_restart

bind "unix://#{Rails.root}/tmp/sockets/puma.sock"
rails_root = Dir.pwd
# 本番環境のみデーモン起動
if Rails.env.production?
    pidfile File.join(rails_root, 'tmp', 'pids', 'puma.pid')
    state_path File.join(rails_root, 'tmp', 'pids', 'puma.state')
    stdout_redirect(
      File.join(rails_root, 'log', 'puma.log'),
      File.join(rails_root, 'log', 'puma-error.log'),
      true
    )
    # デーモン
    daemonize
end