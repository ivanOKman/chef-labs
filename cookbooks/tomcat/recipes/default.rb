# Cookbook:: jboss
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'java_se'

yum_package 'tomcat' do
  action :install
end

yum_package 'unzip' do
  action :install
end

remote_file node['tomcat']['app_name'] do
  source node['tomcat']['app_url']
  action :create_if_missing
  mode '0755'
end

execute 'unzip_app' do
  cwd node['tomcat']['install_folder']
  command "unzip -j testweb.zip -d #{node['tomcat']['deploy_folder']}"
  not_if { ::File.directory?("#{node[:tomcat][:deploy_folder]}/testweb")}
end

service "tomcat" do
  supports :start => true, :stop => true
  action [:enable, :start]
end
