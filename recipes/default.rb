#
# Cookbook Name:: lsyncd
# Recipe:: default
#
# Copyright 2014 Adam Krone <adam.krone@thirdwavellc.com>
# Copyright 2014 Thirdwave, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
