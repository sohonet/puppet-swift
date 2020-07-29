#
# Configure Sohonet traffic_monitor
#
# == Dependencies
#
# == Examples
#
#  include 'swift::proxy::traffic_monitor'
#
# == Parameters
#
# [*config_file*]
# Config file for traffic_monitor
# Defaults to '/etc/swift/traffic_monitor.conf'
#
# == Authors
#
#   David Cole
#
# == Copyright
#
# Copyright 2020 Sohonet
#
class swift::proxy::traffic_monitor (
    $config_file  = '/etc/swift/traffic_monitor.conf'
) {

  include swift::deps

  swift_proxy_config {
    'filter:traffic_monitor/paste.filter_factory':   value => 'traffic_monitor.traffic_monitor:filter_factory';
    'filter:traffic_monitor/config_file':            value => $config_file;
  }
}
