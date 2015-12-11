#
# Cookbook Name:: chef-lsyncd-test
# Recipe:: separate_dirs
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

lsyncd_config '/etc/lsyncd/lsyncd.conf.lua' do
  watched_dir({ source: '/var/www/example1' })
  watched_dir({ source: '/var/www/example2' })
  watched_dir({ source: '/var/www/test', owner: 'nobody', group: 'nogroup' })
  owner 'vagrant'
  group 'vagrant'
end
