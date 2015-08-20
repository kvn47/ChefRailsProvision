# add sidekiq conf
template '/etc/init/sidekiq.conf' do
  source 'sidekiq.conf.erb'
  mode 0644
end

# add sidekiq workers conf
template '/etc/init/workers.conf' do
  source 'workers.conf.erb'
  mode 0644
end

# service 'workers' do
#   provider provider Chef::Provider::Service::Upstart
#   supports %i[start stop restart status]
#   action :start
# end
