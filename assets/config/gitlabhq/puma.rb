app_path = File.expand_path(File.dirname(File.dirname(__FILE__)))

rails_env = ENV['RAILS_ENV'] ||  'production'
environment rails_env

threads 4, 32
workers 2

daemonize true
bind                 "unix://#{app_path}/tmp/puma/sock"
state_path           "#{app_path}/tmp/puma/state"
pidfile              "#{app_path}/tmp/puma/pid"
activate_control_app "unix://#{app_path}/tmp/puma/ctlsock"
stdout_redirect      "#{app_path}/log/puma_access.log", "#{app_path}/log/puma_error.log"

preload_app!
