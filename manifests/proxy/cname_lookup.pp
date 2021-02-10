class swift::proxy::cname_lookup(
  $log_name                = $::os_service_default,
  $log_facility            = $::os_service_default,
  $log_level               = $::os_service_default,
  $log_headers             = $::os_service_default,
  $log_address             = $::os_service_default,
  $storage_domain          = $::os_service_default,
  $lookup_depth            = 1,
  $nameservers             = undef,
) {

  include swift::deps

  swift_proxy_config {
    'filter:cname_lookup/use':                      value => 'egg:swift#cname_lookup';
    'filter:cname_lookup/set log_name':             value => $log_name;
    'filter:cname_lookup/set log_facility':         value => $log_facility;
    'filter:cname_lookup/set log_level':            value => $log_level;
    'filter:cname_lookup/set log_headers':          value => $log_headers;
    'filter:cname_lookup/set log_address':          value => $log_address;
    'filter:cname_lookup/storage_domain' :          value => $storage_domain;
    'filter:cname_lookup/lookup_depth':             value => $lookup_depth;
    'filter:cname_lookup/nameservers':              value => $nameservers;
  }
}
