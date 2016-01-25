# ssh

#### Table of Contents

1. [Overview](#1-overview)
2. [Module Description](#2-module-description)
3. [Setup](#3-setup)
    * [What module affects](#what-module-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning](#beginning)
4. [Usage](#4-usage)
5. [Limitations](#5-limitations)
6. [Development](#6-development)
7. [Release Notes](#7-release-notes)

## 1. Overview

This module can install and configure SSH server config file [ and in the future manages the client ]

## 2. Module Description

Module to manage SSH server config file.


## 3. Setup

 See [Usage](#4-usage)

### What module affects

* This module module will install SSH server package in your system.

### Setup Requirements 

* puppet module install mtulio-ssh

### Beginning 

This is a great module to configure your SSH server config file. 

## 4. Usage


1. Default config

```
 class { '::ssh::sshd_config': }
```

2. Permit root login and allow some users

```
 class { '::ssh::sshd_config': 
   permitrootlogin   => 'yes'
   allow_users       => 'root vagrant admin1'
 }
```

3. Ensure Local User, block root login

```
 class { '::ssh::sshd_config': 
   user_local_enable => 'yes',
   user_local_ensure => 'sysadmin',
   user_password     => '$6$GpTlgkVr$CHLWoyzd4fGD/c4eG2A5JnR8HvsrUF0sGnHrpumysSsJRW5laOfMrvuYX3qjlLriQXGQVHqLq8UIpOxe9Wz2C1', # admin@123
   permitrootlogin   => 'no'
   allow_users       => 'vagrant admin1 admin2 admin3'
 }
```
4. Set sshd banner. Ensure the file is present
```
file {'/etc/ssh/banner':
  path => '/etc/ssh/banner',
  source => "puppet:///modules/ssh/sshd_banner_example_pt-br",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}
class { '::ssh::sshd_config':
  user_local_enable => 'yes',
  user_local_ensure => 'sysadmin',
  user_password     => '$6$GpTlgkVr$CHLWoyzd4fGD/c4eG2A5JnR8HvsrUF0sGnHrpumysSsJRW5laOfMrvuYX3qjlLriQXGQVHqLq8UIpOxe9Wz2C1', # admin@123,
  permitrootlogin   => 'no',
  allow_users       => 'admin1 admin2 admin3'
  bannerpath	    => '/etc/ssh/banner',
}
```


## 5. Limitations

OS compatibility [tested]: 
* Red Hat family 6Server and 7Server

We're working to support more OS.

## 6. Development

See project page at https://github.com/mtulio/puppet-mod-ssh

## 7. Release Notes

[1.3.0]
* Add Allow/Deny users and groups

[1.2.1] <--
* Fix metadata dependences

[1.2.0]
* Add 'banner' support to template config file - sshd_conf

[1.1.0]
* Changing global parameter of sshd_config template:
>> from: 
GSSAPIAuthentication yes
GSSAPICleanupCredentials no
```
```
>> to:
```
GSSAPIAuthentication no
GSSAPICleanupCredentials yes

```

[1.0.1] 
* Review document description

[1.0.0]
* Manage sshd_config

