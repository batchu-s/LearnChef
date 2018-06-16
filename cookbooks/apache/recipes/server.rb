package 'httpd' do
  action :install
end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#  action :create
#end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :name => 'Sumanth Kumar'
  )
  action :create
end

service 'httpd' do
  action [ :enable, :start ]
end
