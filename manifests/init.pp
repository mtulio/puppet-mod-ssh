#
# == Class: ssh
#
# Class to manage SSH service
#
class ssh (
  $service_name    = $::ssh::params::service_name,
  $service_restart = $::ssh::params::service_restart,
  $template_dir    = $::ssh::params::template_dir,
) inherits ssh::params { }
