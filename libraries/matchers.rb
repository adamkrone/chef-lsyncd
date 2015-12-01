def create_lsyncd_config(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:lsyncd_config, :create, resource_name)
end
