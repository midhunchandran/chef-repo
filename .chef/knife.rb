current_dir = File.dirname(__FILE__)
user = ENV['OPSCODE_USER'] || ENV['USER']
log_level                :info
log_location             STDOUT
node_name                user
client_key               "#{ENV['HOME']}/.chef/#{user}.pem"
validation_client_name   "#{ENV['ORGNAME']}-validator"
validation_key           "#{ENV['HOME']}/.chef/#{ENV['ORGNAME']}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{ENV['ORGNAME']}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]

knife[:aws_access_key_id]  = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']

knife[:aws_ssh_key_id] = ENV['AWS_SSH_KEY_ID']
knife[:identity_file] = "#{ENV['HOME']}/.ssh/#{ENV['AWS_SSH_KEY_ID']}.pem"

knife[:rackspace_api_username] = ENV['RACKSPACE_API_USERNAME']
knife[:rackspace_api_key] = ENV['RACKSPACE_API_KEY']
knife[:rackspace_version] = ENV['RACKSPACE_VERSION']

encrypted_data_bag_secret "#{ENV['ENC_SECRET']}"
