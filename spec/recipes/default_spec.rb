require 'spec_helper'

describe 'lsyncd::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['lsyncd']['watched_dirs'] = ['/var/www/test-dir']
    end.converge(described_recipe)
  end

  it 'should install the lsyncd package' do
    expect(chef_run).to install_package('lsyncd')
  end

  it 'should create /var/www/test-dir directory' do
    expect(chef_run).to create_directory('/var/www/test-dir')
  end

  it 'should create /etc/lsyncd directory' do
    expect(chef_run).to create_directory('/etc/lsyncd')
  end

  it 'should create template /etc/lsyncd/lsyncd.conf.lua' do
    expect(chef_run).to create_template('/etc/lsyncd/lsyncd.conf.lua')
  end

  it 'should enable the lsyncd service' do
    expect(chef_run).to enable_service('lsyncd')
  end

  it 'should startthe lsyncd service' do
    expect(chef_run).to start_service('lsyncd')
  end
end
