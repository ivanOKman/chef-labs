#
# Cookbook Name:: web_nginx
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
web 'install nginx' do
  action [ :install, :setup, :start]
  provider 'web_nginx'
end
