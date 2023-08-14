shared_examples 'chrony::init' do
    set :os, :family => 'redhat'

    describe package('chrony') do
        it { should be_installed }
    end
    
    # serverspec cannot list systemd services
    #describe service('chronyd.service') do
    #    it { should be_enabled }
    #    it { should be_running }
    #end

    describe file('/etc/chrony.conf') do
        its(:content) { should contain 'driftfile /var/lib/chrony/drift' }
        its(:content) { should contain 'logdir /var/log/chrony' }
        its(:content) { should contain 'keyfile /etc/chrony.keys' }
        its(:content) { should contain 'log measurements statistics tracking' }
        its(:content) { should contain 'server 0.au.pool.ntp.org' }
        its(:content) { should contain 'server 1.au.pool.ntp.org' }
        its(:content) { should contain 'server 2.au.pool.ntp.org' }
        its(:content) { should contain 'server 3.au.pool.ntp.org' }
        its(:content) { should contain 'rtcsync' }
        its(:content) { should contain 'makestep 1.0 3' }
    end
end
