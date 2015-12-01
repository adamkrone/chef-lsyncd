require 'serverspec'

set :backend, :exec

describe 'Lsyncd' do
  describe service('lsyncd') do
    it { should be_enabled }
  end

  describe file('/etc/lsyncd/lsyncd.conf.lua') do
    it { should be_file }
    it { should contain '"/var/www/example1"' }
    it { should contain '"/var/www/example2"' }
    it { should contain '"/var/www/test"' }
  end

  describe file('/var/www/example1') do
    it { should be_directory }
    it { should be_owned_by 'vagrant' }
    it { should be_grouped_into 'vagrant' }
  end

  describe file('/var/www/example2') do
    it { should be_directory }
    it { should be_owned_by 'vagrant' }
    it { should be_grouped_into 'vagrant' }
  end

  describe file('/var/www/test') do
    it { should be_directory }
    it { should be_owned_by 'nobody' }
    it { should be_grouped_into 'nogroup' }
  end
end
