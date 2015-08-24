# create group
group node['group']

# create user and add to group
user node['user']['name'] do
  gid node['group']
  home "/home/#{node['user']['name']}"
  password node['user']['password']
  shell '/bin/bash'
  supports manage_home: true # need for /home creation
end

# give group sudo privileges
bash 'give group sudo privileges' do
  str = "%#{node.group} ALL=(ALL) ALL"
  code <<-EOH
    sed -i '/%#{node.group}.*/d' /etc/sudoers
    echo '#{str}' >> /etc/sudoers
  EOH
  not_if "grep -xq '#{str}' /etc/sudoers"
end

# allow call restart without password
bash 'allow call restart without password' do
  str = "%#{node.group} ALL=NOPASSWD: /sbin/restart"
  code <<-EOH
    sed -i '/%#{node.group}-pass.*/d' /etc/sudoers
    echo '#{str}' >> /etc/sudoers
  EOH
  not_if "grep -xq '#{str}' /etc/sudoers"
end

# copy bash_aliases
template "/home/#{node.user.name}/.bash_aliases" do
  source 'bash_aliases.erb'
  mode 0644
  owner node.user.name
  group node.group
  action :create_if_missing
end
