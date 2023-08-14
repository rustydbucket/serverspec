shared_examples 'selinux::init' do

    set :os, :family => 'redhat'

    describe selinux do
        it { should be_enforcing }
    end

    describe selinux do
        it { should be_enforcing.with_policy('mls') }
    end

    describe selinux do
        it { should be_permissive }
    end

    describe selinux do
        it { should be_permissive.with_policy('targeted') }
    end

    describe selinux do
        it { should be_disabled }
    end:with_policy
end
