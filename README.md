# Lsyncd Cookbook

[![Latest Version](http://img.shields.io/github/release/adamkrone/chef-lsyncd.svg?style=flat-square)][release]
[![Build Status](http://img.shields.io/travis/adamkrone/chef-lsyncd.svg?style=flat-square)][build]
[![Coverage Status](http://img.shields.io/coveralls/adamkrone/chef-lsyncd.svg?style=flat-square)][coverage]

[release]: https://github.com/adamkrone/chef-lsyncd/releases
[build]: https://travis-ci.org/adamkrone/chef-lsyncd
[coverage]: https://coveralls.io/r/adamkrone/chef-lsyncd

Installs and configures lsyncd. Currently in an early prototype stage, and
focuses on notifying csync2 for replication.

## Supported Platforms

_More thorough platform testing will be completed once this cookbook takes shape._

- Ubuntu 14.04

## Attributes

- `node['lsyncd']['owner']` - Owner of lsyncd service and its config
- `node['lsyncd']['group']` - Group owning lsyncd service and its config
- `node['lsyncd']['watched_dirs']` - Directories to watch

## Recipes

### default

Installs and configures lsyncd.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
