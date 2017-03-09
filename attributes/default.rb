# default.rb

# allow apache to listen to both ports 80 and 443
default['apache']['listen'] = ["*:80", "*:443"]

# attributes needed for the custom httpd.conf template overwrite in apache2 cookbook
default['apache']['docroot_dir'] = '/var/www/html'
default['apache']['log_level'] = 'warn'
