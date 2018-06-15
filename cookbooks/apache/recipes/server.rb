package 'httpd' do
  action :install
end

file 'var/www/html/index.html' do
  content "<html><h1>Hello,World</h1>
  HOSTNAME: #{node['hostname']}<br/>
  IPADDRESS: #{node['ipaddress']}<br/>
  CPU: #{node['cpu']['0']['mhz']}<br/>
  MEMORY: #{node['memory']['total']}
</html>"
end

service 'httpd' do
  action [ :enable, :start ]
end
