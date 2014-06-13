require 'spec_helper'
describe 'cachefilesd' do

  describe 'packages' do
    context 'with default params ' do
      it do
        should contain_package('cachefilesd').with({
          'ensure' => 'installed',
        })
      end
    end
  end

  describe 'config files' do
    context 'with default params ' do
      it {
        should contain _file('/etc/cachefilesd.conf').with({
          'ensure'  =>  'file',
          'owner'   =>  '0',
          'group'   =>  '0',
          'mode'    =>  '0644',
        })
      }


  it { should contain_file('/etc/cachefilesd.conf').with_content("# This file maintained by puppet, do not edit.
dir /var/cache/fscache
tag nfscache

# brun and frun represent the percent of free space (blocks) and free files available in the
# filesystem the cache resides on required for cachefilesd to run freely. (no culling, files
# added as accessed)

brun 10%
frun 10%

# bcull and fcull represent the percent free on the file system at which point cachefilesd
# will start culling the cache (deleteing files)

bcull 7%
fcull 7%

# bstop and fstop represent the percent free on the file system at which point cachefilesd will
# stop writing new files. It will resume writes only after the free space has risen to the
# ammount specified in brun and frun.

bstop 3%
fstop 3%

secctx system_u:system_r:cachefiles_kernel_t:s0
")
  }
      end
    end

end