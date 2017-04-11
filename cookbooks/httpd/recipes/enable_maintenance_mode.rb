# Cookbook:: httpd
# Recipe:: default
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'tomcat'

template "#{node['httpd']['doc']}/maintenance.html" do
  source "main.erb"
  mode "0755"
end

template "#{node['httpd']['trouble']}" do
  source "trouble.erb"
  mode "0755"
end

service "httpd" do
  supports :start => true, :stop => true
  action [:enable, :start]
end
