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
  $package_name     = $::glusterfs::params::package_name,
  $service_name     = $::glusterfs::params::service_name,
  $install_repo     = $::glusterfs::params::install_repo,
  $enable_repo      = $::glusterfs::params::enable_repo,
  $repo_url         = $::glusterfs::params::repo_url,
  $repo_key_url     = $::glusterfs::params::repo_key_url,
  $repo_key_check   = $::glusterfs::params::repo_key_check,
) inherits ::glusterfs::params {

  # validate parameters here

  class { '::glusterfs::repo': } ->
  class { '::glusterfs::install': } ->
  class { '::glusterfs::service': } ->
  Class['::glusterfs']
}
