require 'spec_helper'

['chef-lsyncd-test::separate_dirs',
 'chef-lsyncd-test::combined_dirs'].each do |recipe|
  describe recipe do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(step_into: ['lsyncd_config']).converge(described_recipe)
    end

    it 'should create lsyncd_config[/etc/lsyncd/lsyncd.conf.lua]' do
      expect(chef_run).to create_lsyncd_config('/etc/lsyncd/lsyncd.conf.lua')
    end

    it 'should install the lsyncd package' do
      expect(chef_run).to install_package('lsyncd')
    end

    it 'should create /var/www/example1 directory' do
      expect(chef_run).to create_directory('/var/www/example1')
        .with(owner: 'vagrant', group: 'vagrant')
    end

    it 'should create /var/www/example2 directory' do
      expect(chef_run).to create_directory('/var/www/example2')
        .with(owner: 'vagrant', group: 'vagrant')
    end

    it 'should create /var/www/test directory' do
      expect(chef_run).to create_directory('/var/www/test').with(owner: 'nobody', group: 'nogroup')
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

    it 'should start the lsyncd service' do
      expect(chef_run).to start_service('lsyncd')
    end
  end
end
