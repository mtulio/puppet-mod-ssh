# SSHd_config class - Test 4: Ensure Local User, 
#  block root login and set template
file {'/etc/ssh/banner':
  path   => '/etc/ssh/banner',
  source => 'puppet:///modules/ssh/sshd_banner_example_pt-br',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
}
class { '::ssh::sshd_config':
  user_local_enable => 'yes',
  user_local_ensure => 'sysadmin',
  user_password     => '$6$GpTlgkVr$CHLWoyzd4fGD/c4eG2A5JnR8HvsrUF0sGnHrpumysSsJRW5laOfMrvuYX3qjlLriQXGQVHqLq8UIpOxe9Wz2C1', # admin@123,
  permitrootlogin   => 'no',
  allow_users       => 'admin1 admin2 admin3'
  bannerpath        => '/etc/ssh/banner',
}
