shared_rhel_8 'cron::init' do

    describe crond do 
        # it {should have_entry('* * * * * /usr/local/bin/foo).with_user('mizzy') }
    end