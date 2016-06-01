# create www directory
directory '/var/www' do
  owner node.user.name
  group node.group
  mode 0755
end

# create shared directory structure for app
config_path = "/var/www/#{node['app']}/shared/config"
execute "mkdir -p #{config_path}" do
  user node.user.name
  group node.group
  creates config_path
end

# create database.yml file
template "#{config_path}/database.yml" do
  source 'database.yml.erb'
  mode 0640
  owner node.user.name
  group node.group
end

# create secrets.yml file
template "#{config_path}/secrets.yml" do
  source 'secrets.yml.erb'
  mode 0640
  owner node.user.name
  group node.group
end

# create .env file
# template "/var/www/#{node['app']}/shared/.env" do
#   source '.env.erb'
#   mode 0640
#   owner node.user.name
#   group node.group
# end

# set unicorn config
# template "/etc/init.d/unicorn_#{node['app']}" do
#   source "unicorn.sh.erb"
#   mode 0755
#   owner node['user']['name']
#   group node['group']
# end

# add init script link
# execute "update-rc.d unicorn_#{node['app']} defaults" do
#   not_if "ls /etc/rc2.d | grep unicorn_#{node['app']}"
# end
