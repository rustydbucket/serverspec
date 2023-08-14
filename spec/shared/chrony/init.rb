shared_examples 'chrony::init' do
    set :os, :family => 'redhat'

    describe package('chronyd') do
        it { should be_installed }
    end

    describe service('chronyd') do
        it { should be_enabled }
        it { should be_running }
    end

    describe file('/etc/chrony.conf') do
        its(:content) { should contain 'driftfile /var/lib/chrony/drift' }
        its(:content) { should contain 'logdir /var/log/chrony' }
        its(:content) { should contain 'keyfile /etc/chrony.keys' }
        its(:content) { should contain 'log measurements statistics tracking' }
        its(:content) { shoold contain 'server 0.au.pool.ntp.org iburst' }
        its(:content) { shoold contain 'server 1.au.pool.ntp.org iburst' }
        its(:content) { shoold contain 'server 2.au.pool.ntp.org iburst' }
        its(:content) { shoold contain 'server 3.au.pool.ntp.org iburst' }
        its(:content) { should contain 'rtcsync' }
        its(:content) { should contain 'makesetp 1.0 3' }
    end
end
