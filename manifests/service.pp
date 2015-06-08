# == Class glusterfs::service
#
# This class is meant to be called from glusterfs.
# It ensure the service is running.
#
class glusterfs::service {

  $service_name = $::glusterfs::service_name

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
