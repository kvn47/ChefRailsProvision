apt_repository 'postgresql' do
  action :add
  uri 'http://apt.postgresql.org/pub/repos/apt'
  distribution "#{node.lsb.codename}-pgdg"
  components ['main']
  keyserver 'https://www.postgresql.org/media/keys/ACCC4CF8.asc'
end

execute 'apt-get update'

package "postgresql-#{node.postgresql.version}"
package "postgresql-contrib-#{node.postgresql.version}"

# change postgres password
execute 'change postgres password' do
  user 'postgres'
  command "psql -c \"alter user postgres with password '#{node['db']['root_password']}';\""
end

# create new postgres user
execute 'create new postgres user' do
  user 'postgres'
  command "psql -c \"create user #{node['db']['user_name']} with password '#{node['db']['password']}';\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname='#{node['db']['user_name']}'\" | wc -l`.chomp == "1" }
end

# create new postgres database
execute 'create new postgres database' do
  user 'postgres'
  command "psql -c \"create database #{node['app']} owner #{node['db']['user_name']};\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_database WHERE datname='#{node['app']}'\" | wc -l`.chomp == "1" }
end
