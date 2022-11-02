# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'atop class' do
  context 'with parameters' do
    let(:pp) { "class { 'atop': }" }

  describe package('atop') do
    it { is_expected.to contain_package('atop') }
    it { is_expected.to be_running }
  end
  describe service('atop') do
	it { is_expected.to contain_service('atop') }
	it { is_expected.to be_running }
  end
  describe file('/etc/sysconfig/atop') do
	it { is_expected.to be_file }
	it { is_expected.to be_mode 644 }
	it { is_expected.to be_owned_by 'root' }
	it { is_expected.to be_grouped_into 'root' }
  end
  describe file('/etc/logrotate.d/atop') do
	it { is_expected.to be_file }
	it { is_expected.to be_mode 644 }
	it { is_expected.to be_owned_by 'root' }
	it { is_expected.to be_grouped_into 'root' }
  end
  describe file('/usr/lib/systemd/system/atop.service') do
	it { is_expected.to be_file }
	it { is_expected.to be_mode 644 }
	it { is_expected.to be_owned_by 'root' }
	it { is_expected.to be_grouped_into 'root' }
  end
 end
end