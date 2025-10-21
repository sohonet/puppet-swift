#
# Configures dependencies that are common for all storage
# types.
#   - installs an rsync server
#   - installs required packages
#
# == Parameters
#  [*storage_local_net_ip*] ip address that the swift servers should
#    bind to. Required.
#
#  [*rsync_use_xinetd*]
#   (optional) Override whether to use xinetd to manage rsync service
#   Defaults to swift::params::xinetd_available
#
# == Dependencies
#
# == Examples
#
# == Authors
#
#   Dan Bode dan@puppetlabs.com
#
# == Copyright
#
# Copyright 2011 Puppetlabs Inc, unless otherwise noted.
#
class swift::storage(
  $storage_local_net_ip,
  $rsync_use_xinetd = $::swift::params::xinetd_available,
  $rsync_logfile = undef,
  $rsync_reverse_lookup = true,
) inherits swift::params {

  include swift::deps

  if $rsync_use_xinetd and ! $::swift::params::xinetd_available {
    fail('xinetd is not available in this distro')
  }

  ensure_resource('class', 'rsync::server', {
    use_xinetd     => $rsync_use_xinetd,
    address        => $storage_local_net_ip,
    use_chroot     => 'no',
    log_file       => $rsync_logfile,
    reverse_lookup => $rsync_reverse_lookup,
  })
}
