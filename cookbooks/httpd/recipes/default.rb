# Cookbook:: httpd
# Recipe:: default
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'tomcat'

yum_package 'httpd' do
  action :install
end

template "#{node['httpd']['vhost']}" do
  source "httpd.erb"
  mode "0755"
end

service "httpd" do
  supports :start => true, :stop => true
  action [:enable, :start]
end
