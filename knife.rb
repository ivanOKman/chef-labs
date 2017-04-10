current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "admin"
client_key               "#{current_dir}/admin.pem"
chef_server_url          "https://chefsrv/organizations/lab8"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:editor] = 'vim'
