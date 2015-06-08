# == Class glusterfs::params
#
# This class is meant to be called from glusterfs.
# It sets variables according to platform.
#
class glusterfs::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'glusterfs'
      $service_name = 'glusterfs'
    }
    'RedHat', 'Amazon': {
      $package_name = 'glusterfs'
      $service_name = 'glusterfs'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
