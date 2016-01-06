default['port'] = '22'
default['group'] = 'deploy'
default['user']['name'] = 'deploy'

default['app'] = 'projectxx'
default['app_path'] = '/var/www/projectxx/current'
default['app_shared_path'] = '/var/www/projectxx/shared'

default['domain_name'] = 'localhost'
default['rails_env'] = 'production'

default['secrets']['secret_key_base'] = ''
default['secrets']['devise_secret_key'] = ''
default['db']['user_name'] = ''
default['db']['password'] = ''
default['secrets']['admin_name'] = ''
default['secrets']['admin_password'] = ''
default['secrets']['http_auth_name'] = ''
default['secrets']['http_auth_password'] = ''
default['recaptcha']['public_key'] = ''
default['recaptcha']['private_key'] = ''
default['smtp']['login'] = ''
default['smtp']['password'] = ''
default['smtp']['port'] = ''
default['smtp']['server'] = ''
default['smtp']['authentication'] = ''
default['smtp']['mailgun_api_key'] = ''

default['nodejs']['dir'] = '/usr/local'
default['nodejs']['version'] = '0.12.7'

default['redis']['version'] = '3.0.3'
default['ruby']['version'] = '2.3.0'
default['puma']['version'] = '2.13.4'

default['nginx_passenger']['nginx_workers'] = 4
default['nginx_passenger']['nginx_connections'] = 768
default['nginx_passenger']['catch_default'] = false

default['nginx_passenger']['ruby'] = "/usr/bin/passenger_free_ruby"
# default.nginx_passenger.ruby                  = "/usr/bin/ruby"
default['nginx_passenger']['max_pool_size'] = 8
default['nginx_passenger']['max_instances_per_app'] = 0
default['nginx_passenger']['min_instances'] = 2
default['nginx_passenger']['pool_idle_time'] = 300
default['nginx_passenger']['max_requests'] = 0

default['nginx_passenger']['use_ssl'] = false
default['nginx_passenger']['cert_databag'] = "ssl_certs"
default['nginx_passenger']['cert_authority'] = "Self Signed"

default['nginx_passenger']['site_min_instances'] = 2
default['nginx_passenger']['site_max_body_size'] = "8M"
default['nginx_passenger']['keep_env_path'] = true

default['sidekiq']['workers'] = 1
