#
# Cookbook:: .
# Recipe:: apache2
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# use apache2 cookbook
include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'

# override the httpd.conf template for CentOS 7
r = edit_resource!(:template, 'apache2.conf') do
  source = 'apache2.conf.erb'
end
template 'apache2.conf' do
  path '/etc/httpd/conf/httpd.conf'
  source 'apache2.conf.erb'
end

# create the web home page from template
template '/var/www/html/index.html' do
  source 'index.html.erb'
end

