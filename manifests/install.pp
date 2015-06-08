# == Class glusterfs::install
#
# This class is called from glusterfs for install.
#
class glusterfs::install {

  package { $::glusterfs::package_name:
    ensure => present,
  }
}
