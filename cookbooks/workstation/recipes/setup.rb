package 'tree'

package 'ntp' do
  action :install
end

file '/etc/motd' do
  content "This server is the property of Sumanth!
  HOSTNAME: #{node['hostname']}
  IPADDRESSS: #{node['ipaddress']}
  MEMORY: #{node['memory']['total']}
  CPU: #{node['cpu']['0']['mhz']}

"

  owner 'root'
  group 'root'
  mode '0644'
end

service 'ntpd' do
  action [ :enable, :start ]
end

