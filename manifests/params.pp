# == Class glusterfs::params
#
# This class is meant to be called from glusterfs.
# It sets variables according to platform.
#
class glusterfs::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name   = 'glusterfs-server'
      $service_name   = 'glusterd'
      $install_repo   = true
      $enable_repo    = true
      $repo_provider  = 'yum'
      $repo_url       = 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/epel-$releasever/$basearch/'
      $repo_key_url   = 'http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key'
      $repo_key_check = true
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
