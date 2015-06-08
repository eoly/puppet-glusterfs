class glusterfs::repo {

  $package_name   = $::glusterfs::package_name
  $install_repo   = $::glusterfs::install_repo
  $enable_repo    = $::glusterfs::enable_repo
  $repo_provider  = $::glusterfs::repo_provider
  $repo_url       = $::glusterfs::repo_url
  $repo_key_url   = $::glusterfs::repo_key_url
  $repo_key_check = $::glusterfs::repo_key_check

  if $install_repo {
    $repo_ensure = 'present'
  } else {
    $repo_ensure = 'absent'
  }

  if $repo_provider == 'yum' {
    yumrepo { 'glusterfs':
      baseurl  => $repo_url,
      descr    => 'GlusterFS is a clustered file-system capable of scaling to several petabytes',
      enabled  => $enable_repo,
      gpgcheck => $repo_key_check,
      gpgkey   => $repo_key_url,
    }
  }
}
