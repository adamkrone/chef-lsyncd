#
# Cookbook Name:: lsyncd
# Provider:: lsyncd_config
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

require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class LsyncdConfig < Chef::Provider::LWRPBase
      include Chef::DSL::IncludeRecipe
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        package 'lsyncd'

        # Make sure watched directories exist
        new_resource.watched_dirs.each do |dir|
          dir_owner = (dir[:owner] || new_resource.owner)
          dir_group = (dir[:group] || new_resource.group)

          directory dir[:path] do
            owner dir_owner
            group dir_group
            recursive true
            action :create
          end
        end

        directory '/etc/lsyncd' do
          action :create
        end

        template new_resource.config_file do
          cookbook new_resource.cookbook
          source new_resource.template
          variables(watched_dirs: new_resource.watched_dirs)
          action :create
        end

        service 'lsyncd' do
          supports start: true, stop: true, restart: true, status: true
          action [:enable, :start]
        end
      end
    end
  end
end
