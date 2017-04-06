#
# Cookbook:: .
# Recipe:: ssl_certificate
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# # force reinstall of mod_ssl so /etc/httpd/conf.d/ssl.conf exists
# package 'mod_ssl' do
#   action [:remove, :install]
# end

# we need to save the resource variable to get the key and certificate file paths
cert = ssl_certificate 'comcast_test' do
  # we want to be able to use node['comcast_test'] to configure the certificate
  namespace node['comcast_test'] # optional but recommended
  key_path node['ssl_certificate']['key_path']
  cert_path node['ssl_certificate']['cert_path']
  notifies :restart, 'service[apache2]'
end

# # you can now use the #cert_path and #key_path methods to use in your
# # web/mail/ftp service configurations
# log "comcast_test certificate is here: #{cert.cert_path}"
# log "comcast_test private key is here: #{cert.key_path}"
# log "comcast_test cert: #{cert.inspect.to_yaml}"
