package 'httpd' do
  action :install
end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#  action :create
#end

remote_file '/var/www/html/sumanth.png' do
  source 'https://upload.wikimedia.org/wikipedia/commons/7/72/Cristiano_Ronaldo_2017.jpg'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :name => 'Sumanth Kumar'
  )
  action :create
#  notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
