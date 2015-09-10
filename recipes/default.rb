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
remote_file "#{Chef::Config[:file_cache_path]}/gitlab-ce_7.14.2-ce.1_amd64.deb" do
  source 'https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/precise/gitlab-ce_7.14.2-ce.1_amd64.deb/download'
end

apt_package 'openssh-server'
include_recipe 'postfix'

dpkg_package "#{Chef::Config[:file_cache_path]}/gitlab-ce_7.14.2-ce.1_amd64.deb" do
  action :install
end

# Set hostname
template '/etc/gitlab/gitlab.rb' do
  source 'gitlab.rb'
  action :create
end

# Install and start Gitlab
execute 'sudo gitlab-ctl reconfigure'
