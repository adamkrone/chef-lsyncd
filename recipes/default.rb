#
# Cookbook Name:: lsyncd
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
#

package 'lsyncd'

# Make sure watched directories exist
node['lsyncd']['watched_dirs'].each do |dir|
  directory dir do
    owner node['lsyncd']['owner']
    group node['lsyncd']['group']
    recursive true
    action :create
  end
end

directory '/etc/lsyncd' do
  action :create
end

template '/etc/lsyncd/lsyncd.conf.lua' do
  source 'lsyncd.conf.lua.erb'
  action :create
end

service 'lsyncd' do
  supports start: true, stop: true, restart: true, status: true
  action [:enable, :start]
end
