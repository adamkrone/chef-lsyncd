#
# Cookbook:: lsyncd
# Resource:: lsyncd_config
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

require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class LsyncdConfig < Chef::Resource::LWRPBase
      self.resource_name = :lsyncd_config
      actions :create, :delete
      default_action :create

      attribute :config_file, kind_of: String, name_attribute: true
      attribute :cookbook, kind_of: String, default: 'lsyncd'
      attribute :template, kind_of: String, default: 'lsyncd.conf.lua.erb'
      attribute :owner, kind_of: String, default: 'deploy'
      attribute :group, kind_of: String, default: 'deploy'
      attribute :watched_dirs, kind_of: Array, default: []

      def watched_dir(dir)
        watched_dir = dir.to_h
        watched_dir[:syncid] ||= node['hostname']

        watched_dirs << watched_dir
      end
    end
  end
end
