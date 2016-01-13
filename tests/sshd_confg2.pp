# SSHd_config class - Test 2: Permit root login and allow some users
class { '::ssh::sshd_config': 
  permitrootlogin   => 'yes'
  allow_users       => 'root admin1'
}
