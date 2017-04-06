# default.rb

# allow apache to listen to both ports 80 and 443
default['apache']['listen'] = ["*:80", "*:443"]

# attributes needed for the custom httpd.conf template overwrite in apache2 cookbook
default['apache']['docroot_dir'] = '/var/www/comcast_test'
default['apache']['log_level'] = 'warn'
default['apache']['version'] = '2.4'

# attributes needed for the self signed certificate
node.default['default']['common_name'] = 'comcast_test'
node.default['default']['ssl_cert']['source'] = 'self-signed'
node.default['default']['ssl_key']['source'] = 'self-signed'
default['ssl_certificate']['key_path'] = '/etc/pki/tls/certs/default.key'
default['ssl_certificate']['cert_path'] = '/etc/pki/tls/certs/default.pem'
