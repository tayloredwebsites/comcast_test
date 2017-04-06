#
# Cookbook:: .
# Recipe:: apache2
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'

begin
  templ = resources(template: 'apache2.conf')
  templ.cookbook 'comcast_test'
  # templ.source 'index.html.erb'
  templ.path '/etc/httpd/conf/httpd.conf'
  templ.action :create
  templ.source 'apache2.conf.erb'
  templ.owner 'root'
  templ.group node['apache']['root_group']
  templ.mode 0644
  templ.notifies :reload, 'service[apache2]', :delayed
end

# make sure the directory for comcast_test exists
www_dir = "/var/www/comcast_test"
directory www_dir do
  owner 'root'
  group 'root'
  recursive true
end

# create the web home page from template
template '/var/www/comcast_test/index.html' do
  source 'index.html.erb'
end

apache_site 'comcast_test' do
  enable false
end

web_app 'comcast_test' do
  # template 'web_app.conf.erb'
  # template 'site.conf.erb'
  docroot '/var/www/comcast_test'
  server_name 'comcast_test'
  server_aliases [node['fqdn'], "10.0.0.101"]
end

