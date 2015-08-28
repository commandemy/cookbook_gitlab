#
# Cookbook Name:: gitlab
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

# Download Omnibus package and install dependencies
remote_file "#{Chef::Config[:file_cache_path]}/gitlab-ce_7.12.2~omnibus.1-1_amd64.deb" do
  source 'https://downloads-packages.s3.amazonaws.com/ubuntu-12.04/gitlab-ce_7.12.2~omnibus.1-1_amd64.deb'
end

apt_package 'openssh-server'
include_recipe 'postfix'

dpkg_package "#{Chef::Config[:file_cache_path]}/gitlab-ce_7.12.2~omnibus.1-1_amd64.deb" do
  action :install
end

# Set hostname
template '/etc/gitlab/gitlab.rb' do
  source 'gitlab.rb'
  action :create
end

# Install and start Gitlab
execute 'sudo gitlab-ctl reconfigure'
