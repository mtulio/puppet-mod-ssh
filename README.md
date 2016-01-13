# Linux

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

1. Using default template

 ~~~
  class {'::ssh::sshd_config':
    port => 22,
    permitrootlogin => 'yes',
  }
 ~~~

## Limitations

OS compatibility [tested]: 
* Red Hat family 7+ 

We're working to support more OS.

## Development

See project page at https://github.com/mtulio/puppet-mod-ssh

## Release Notes

[1.0.0]
* Manage sshd_config

