require 'spec_helper'

describe 'glusterfs' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "glusterfs class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('glusterfs::params') }
          it { is_expected.to contain_class('glusterfs::install').that_comes_before('glusterfs::config') }
          it { is_expected.to contain_class('glusterfs::config') }
          it { is_expected.to contain_class('glusterfs::service').that_subscribes_to('glusterfs::config') }

          it { is_expected.to contain_service('glusterfs') }
          it { is_expected.to contain_package('glusterfs').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'glusterfs class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('glusterfs') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
