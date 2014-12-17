require 'serverspec'

set :backend, :exec

describe 'Lsyncd' do
  describe service('lsyncd') do
    it { should be_enabled }
  end

  describe file('/etc/lsyncd/lsyncd.conf.lua') do
    it { should be_file }
    it { should contain '"/var/www"' }
    it { should contain '"/opt/test"' }
  end
end
