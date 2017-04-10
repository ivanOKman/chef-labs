# Cookbook:: jboss
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'java_se'

remote_file node['jboss']['dist_name'] do
  source node['jboss']['url']
  action :create_if_missing
  mode '0755'
end

remote_file node['jboss']['app_name'] do
  source node['jboss']['app_url']
  action :create_if_missing
  mode '0755'
end

yum_package 'unzip' do
  action :install
end

execute 'unzip_jboss' do
  cwd node['jboss']['install_folder']
  command 'unzip jboss7.zip'
  not_if { ::File.directory?("#{node[:jboss][:jboss_home]}")}
end

#execute 'change_owner_to_jboss' do
#  command "chown -R #{node['jboss']['user']}:#{node['jboss']['user']} #{node['jboss']['jboss_home']}"
#end

execute 'unzip_app' do
  cwd node['jboss']['install_folder']
  command "unzip hudson.zip -d #{node['jboss']['deploy_folder']}"
  not_if { ::File.exist?("#{node[:jboss][:deploy_folder]}/hudson")}
end

template "#{node['jboss']['deploy_folder']}/hudson/hudson.xml" do
  source "xml.erb"
  variables({
    :engine => node[:jboss][:engine]
  })
end

template "/etc/init.d/jboss" do
  source "jboss_init_script.erb"
  mode "0755"
  variables({
    :home => node[:jboss][:jboss_home],
    :ip => node[:jboss][:jboss_ip],
})
  #notifies :restart, 'service[jboss]', :immediately
end
  
service "jboss" do
  supports :start => true, :stop => true, :status => false
  action [:enable, :start]
end
