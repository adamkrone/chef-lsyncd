#
# Cookbook Name:: chef-lsyncd-test
# Recipe:: combined_dirs
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

node.normal['lsyncd_test']['watched_dirs'] = [
  { source: '/var/www/example1' },
  { source: '/var/www/example2' },
  { source: '/var/www/test', owner: 'nobody', group: 'nogroup' }
]

lsyncd_config '/etc/lsyncd/lsyncd.conf.lua' do
  watched_dirs node['lsyncd_test']['watched_dirs']
  owner 'vagrant'
  group 'vagrant'
end
