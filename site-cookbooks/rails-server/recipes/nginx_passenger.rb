# include_recipe "apt"

package 'apt-transport-https'

apt_repository 'passenger' do
  action        :add
  uri           'https://oss-binaries.phusionpassenger.com/apt/passenger'
  distribution  node.lsb.codename
  components    ['main']
  keyserver     'hkp://keyserver.ubuntu.com:80'
  key           '561F9B9CAC40B2F7'
end

package 'nginx-common' do
  options '-o DPkg::Options::="--force-confold"'
end

package 'passenger'
package 'nginx-extras'

service 'nginx' do
  action    %i[enable start]
  supports  %i[enable start stop disable reload restart]
  # supports %i[status restart]
  # action :start
end

# set nginx conf
template '/etc/nginx/nginx.conf' do
  source 'nginx-passenger.conf.erb'
  # action :create
end

# set nginx site config
template "/etc/nginx/sites-enabled/#{node['app']}.conf" do
  source 'site-passenger.conf.erb'
  mode 0644
  owner node['user']['name']
  group node['group']
  # notifies :restart, 'service[nginx]', :delayed
end

# remove default nginx config
default_path = '/etc/nginx/sites-enabled/default'
execute "rm -f #{default_path}" do
  only_if { File.exists?(default_path) }
end

# directory node.nginx_passenger.sites_dir do
#   action      :create
#   recursive   true
#   mode        0755
# end

directory node.nginx_passenger.log_dir do
  action :create
  recursive true
  mode 0755
  owner 'www-data'
end
