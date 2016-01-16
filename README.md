# ssh

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What module affects](#what-module-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning](#beginning)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

This module can install and configure SSH server config file [ and in the future manages the client ]

## Module Description

Module to manage SSH server config file.


## Setup

 See [Usage](#usage)

### What module affects

* This module module will install SSH server package in your system.

### Setup Requirements 

* none

### Beginning 

This is a great module to configure your SSH server config file. 

## Usage


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


## Limitations

OS compatibility [tested]: 
* Red Hat family 6Server and 7Server

We're working to support more OS.

## Development

See project page at https://github.com/mtulio/puppet-mod-ssh

## Release Notes

[1.0.1] 
* Review document description

[1.0.0]
* Manage sshd_config

