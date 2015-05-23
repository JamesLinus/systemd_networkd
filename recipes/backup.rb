#
# Cookbook Name:: systemd_networkd
# Recipe:: backup
#
# Copyright 2014, Intel Corp
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "cfgdump.rb" do
  path "/usr/bin/cfgdump"
  action :create
end

