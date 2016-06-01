# install puma gem
# gem_package 'puma' do
#   action :install
#   version node['puma']['version']
#   gem_binary '/usr/local/bin/gem'
#   options '--no-ri --no-rdoc'
# end

# add puma init conf
template '/etc/init/puma.conf' do
  source 'puma-init.conf.erb'
  mode 0644
end

# add puma manager conf
template '/etc/init/puma-manager.conf' do
  source 'puma-manager.conf.erb'
  mode 0644
end

# add puma conf
template '/etc/puma.conf' do
  source 'puma.conf.erb'
  mode 0644
end

# add puma app conf
template "#{node['app_shared_path']}/config/puma.rb" do
  source 'puma.rb.erb'
  mode 0644
  # notifies :restart, 'service[puma]', :delayed
end

# service 'puma-manager' do
#   provider Chef::Provider::Service::Upstart
#   supports %i[start stop restart status]
#   action :start
# end
