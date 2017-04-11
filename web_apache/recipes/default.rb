# Cookbook Name:: web_apache
# Recipe:: default
#
web "install apache" do
  action :install
  provider "web_apache"
end
