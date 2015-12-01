# Lsyncd Cookbook

[![Latest Version](http://img.shields.io/github/release/thirdwavellc/chef-lsyncd.svg?style=flat-square)][release]
[![Build Status](http://img.shields.io/travis/thirdwavellc/chef-lsyncd.svg?style=flat-square)][build]
[![Coverage Status](http://img.shields.io/coveralls/thirdwavellc/chef-lsyncd.svg?style=flat-square)][coverage]

[release]: https://github.com/thirdwavellc/chef-lsyncd/releases
[build]: https://travis-ci.org/thirdwavellc/chef-lsyncd
[coverage]: https://coveralls.io/r/thirdwavellc/chef-lsyncd

Installs and configures lsyncd. Currently in an early prototype stage, and
focuses on notifying csync2 for replication.

##LWRPs

This cookbook is intended to be consumed through its LWRP, and therefore
doesn't include any recipes. Here is an overview of the LWRP provided.

###lsyncd_config

**Attributes:**

| Name         | Description                                   | Type   | Required | Default               |
| ------------ | --------------------------------------------- | ------ | -------- | --------------------- |
| config_file  | Location of generated lsyncd config file      | String | true     | N/A                   |
| cookbook     | Cookbook that contains lsyncd config template | String | false    | 'lsyncd'              |
| template     | Template for the lsyncd config                | String | false    | 'lsyncd.conf.lua.erb' |
| owner        | Owner of watched directories                  | String | false    | 'deploy'              |
| group        | Group of watched directories                  | String | false    | 'deploy'              |
| watched_dirs | Directories to watch for changes              | Array  | false    | []                    |

Instead of specifying all watched_dirs together as an array, you can use
`watched_dir` to add each directory individually.

**Example:**

```ruby
lsyncd_config '/etc/lsyncd/lsyncd.conf.lua' do
  watched_dir({ source: '/var/www/site1/shared' })
  watched_dir({ source: '/var/www/site2/shared' })
end
```

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
