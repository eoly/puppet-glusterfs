# == Class: glusterfs
#
# Full description of class glusterfs here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class glusterfs (
  $package_name = $::glusterfs::params::package_name,
  $service_name = $::glusterfs::params::service_name,
) inherits ::glusterfs::params {

  # validate parameters here

  class { '::glusterfs::install': } ->
  class { '::glusterfs::config': } ~>
  class { '::glusterfs::service': } ->
  Class['::glusterfs']
}
