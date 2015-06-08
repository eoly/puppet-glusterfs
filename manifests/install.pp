# == Class glusterfs::install
#
# This class is called from glusterfs for install.
#
class glusterfs::install {

  $package_name = $::glusterfs::package_name

  package { $package_name:
    ensure => present,
  }
}
