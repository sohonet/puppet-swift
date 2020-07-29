#
# Configure swift informant
#
# == Dependencies
#
# == Examples
#
#  include 'swift::proxy::informant'
#
# == Parameters
#
# [*combined_events*]
# send multiple statsd events per packet as supported by statsdpy
# Default to 'no'
#
# [*statsd_host*]
# statsd destination addr
# Default to '127.0.0.1'
#
# [*statsd_post*]
# statsd destination port
# Default to '8125'
#
# == Authors
#
#   David Cole
#
# == Copyright
#
# Copyright 2020 Sohonet
#
class swift::proxy::informant (
    $statsd_host      = '127.0.0.1',
    $statsd_port      = '8125',
    $combined_events  = 'no'
) {

  include swift::deps

  swift_proxy_config {
    'filter:informant/use':               value => 'egg:informant#informant';
    'filter:informant/statsd_host':       value => $statsd_host;
    'filter:informant/statsd_port':       value => $statsd_port;
    'filter:informant/combined_events':   value => $combined_events;
  }
}
