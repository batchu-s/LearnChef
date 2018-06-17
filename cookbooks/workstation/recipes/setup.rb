package 'tree'

package 'ntp' do
  action :install
end

template '/etc/motd' do
  source 'motd.erb'
  variables(
    :name => 'Sumanth Kumar'
  )
  action :create
end

service 'ntpd' do
  action [ :enable, :start ]
end

user 'suresh' do
  comment 'suresh'
  uid '134'
  shell '/bin/bash'
  home '/home/suresh'
  manage_home true
end

group 'test' do
  members 'suresh'
  append true
end
