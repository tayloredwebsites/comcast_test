#
# Cookbook:: comcast_test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

selinux_policy_port '80' do
    protocol 'tcp'
    secontext 'http_port_t'
end
