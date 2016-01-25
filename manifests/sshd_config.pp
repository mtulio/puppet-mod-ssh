#
# == Class: ssh::sshd_config
#
# Class to manage the main sshd_config file.
#
# All parameters default to undef, meaning that the original
# defaults are used.
#
# === Parameters
#
# Class to manage the main sshd_config file.
#
# === Examples
# Sample usage:
#     include '::ssh::sshd_config'
#
# === Authors
#
# Marco Túlio R Braga <git@mtulio.eng.br>
#
class ssh::sshd_config (
  ### CUSTOM PARAMETERS - CLASS CONFIG ###
  $user_local_enable  = 'no',
  $user_name_ensure   = undef,
  $user_password      = undef,

  ### GLOBAL CONFIG PARAMETERS - sshd_config ###
  $port                            = undef,
  $permitrootlogin                 = undef,
  $pubkeyauthentication            = undef,
  $passwordauthentication          = undef,
  $challengeresponseauthentication = undef,
  $usepam                          = undef,
  $x11forwarding                   = undef,
  $clientaliveinterval             = undef,
  $clientalivecountmax             = undef,
  $usedns                          = undef,
  $bannerpath                      = undef,
  $match                           = undef,
  $internalsftp                    = false,
  $deny_users                      = undef,
  $allow_users                     = undef,
  $deny_groups                     = undef,
  $allow_groups                    = undef,

  ## SERVICE PARAMETERS ###
  $template_dir                    = $template_dir,
  $service_name                    = $service_name,
) inherits ssh {

  include '::ssh::service'
  
  # Check local user
  if $user_local_enable == 'yes' {
    if $user_name_ensure == undef or $user_password == undef {
      fail('#ERROR ssh::sshd_config> When [user_local_enable] is enabled, you must set [user_name_ensure] and [user_password].')
    }
    else {
      $allow_users_arr = "${user_name_ensure} ${allow_users}"

      # Create user 
      user { $user_name_ensure :
        ensure   => present,
        comment  => "User ${user_name_ensure} - Created by Puppet",
        name     => $user_name_ensure,
        home     => "/home/${user_name_ensure}",
        password => $user_password,
      }
    }
  }
  else { # Set allow_users
    $allow_users_arr = $allow_users
  }

  if $deny_users   != undef { $deny_users_arr   = $deny_users }
  if $deny_groups  != undef { $deny_groups_arr  = $deny_groups }
  if $allow_groups != undef { $allow_groups_arr = $allow_groups }

  # Create config file
  file { '/etc/ssh/sshd_config':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/${template_dir}/sshd_config.erb"),
    notify  => Service[$service_name],
  }

}
