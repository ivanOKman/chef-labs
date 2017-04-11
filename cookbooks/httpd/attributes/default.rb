default['httpd']['vhost'] = "/etc/httpd/conf.d/vhosts.conf"
default['httpd']['trouble'] = "/etc/httpd/conf.d/trouble.conf"
default['httpd']['doc'] = "/var/www/html/"
default['httpd']['maintenance_file'] = "#{node['httpd']['doc']}/maintenance.html"
