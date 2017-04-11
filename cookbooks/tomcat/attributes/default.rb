default['tomcat']['tomcat_home'] = "/usr/share/tomcat"
default['tomcat']['install_folder'] = "/opt"
default['tomcat']['app_name'] = "/opt/testweb.zip"
default['tomcat']['app_url'] = "http://www.cumulogic.com/download/Apps/testweb.zip"
default['tomcat']['deploy_folder'] = "#{node['tomcat']['tomcat_home']}/webapps"
default['tomcat']['tomcat_ip'] = '127.0.0.1'
