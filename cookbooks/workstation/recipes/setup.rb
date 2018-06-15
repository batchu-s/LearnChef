package 'tree'

package 'ntp' do
  action :install
end

file '/etc/motd' do
  content 'This server is the property of Sumanth!'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'ntpd' do
  action [ :enable, :start ]
end

