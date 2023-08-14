require 'spec_helper'

describe 'puppet-master.tud.local' do
  include_examples 'chrony::init'
  include_examples 'auditd::init'
end