#
# Configure Swift  Keymaster middleware.
#
# == Examples
#
#  include swift::proxy::keymaster
#
# == Parameters
#
# [*keymaster_config_path*]
# Sets the path from which the keymaster config options should be read
# Default: undef

# [*encryption_root_secret*]
# root secret from which encryption keys are derived
# Default: undef
#
class swift::proxy::keymaster (
  $keymaster_config_path = undef,
  $encryption_root_secret = undef,
) {

  include swift::deps

  swift_proxy_config {
    'filter:keymaster/use':                   value => 'egg:swift#keymaster';
    'filter:keymaster/keymaster_config_path' : value => $keymaster_config_path;
    'filter:keymaster/encryption_root_secret': value => $encryption_root_secret;
  }
}

