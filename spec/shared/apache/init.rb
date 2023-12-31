shared_examples 'apache::init' do
    set :os, :family => 'redhat'
    
    describe package('httpd') do
      it { should be_installed }
    end
  
    describe service('httpd') do
      it { should be_enabled   }
      it { should be_running   }
    end
  
    describe port(80) do
      it { should be_listening }
    end
  
    describe file('/etc/httpd/conf/httpd.conf') do
      it { should be_file }
      its(:content) { should match /ServerName ['"]#{RSpec.configuration.host}['"]{0,1}/ }
    end
  
end
