#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with glusterfs](#setup)
    * [What glusterfs affects](#what-glusterfs-affects)
    * [Beginning with glusterfs](#beginning-with-glusterfs)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

GlusterFS Puppet Module

## Module Description

This module manages the GlusterFS repository, package installation, and service. There are also custom types and providers for managing a Gluster cluster that can be used in your profile classes.

## Setup

### What glusterfs affects

* Optionally installs and enables GlusterFS official package repository
* Installs the GlusterFS operating system package
* Manages the GlusterFS service

### Beginning with glusterfs

To install the GlusterFS repo, package, and manage the service you simply declare the `glusterfs` class.

~~~puppet
class { 'glusterfs': }
~~~

## Usage

~~~puppet
node /storage/ {
  class { 'glusterfs': }
  glusterfs_pool { ['192.168.1.100', '192.168.1.101']: } ->
  glusterfs_vol { 'data':
    replica => 2,
    brick   => ['192.168.1.100:/mnt/brick', '192.168.1.101:/mnt/brick'],
  }
}
~~~

## Reference

### Classes

#### Public Classes

* [`glusterfs`](#class-glusterfs)

#### Private Classes

* [`glusterfs::repo`]: Manages the GlusterFS package repo
* [`glusterfs::install`]: Installs the GlusterFS package
* [`glusterfs::service`]: Manages the GlusterFS service

### Types

* [`glusterfs_pool`](#type-glusterfs_pool)
* [`glusterfs_vol`](#type-glusterfs_vol)

#### Class: `glusterfs`

Main class, includes all other classes.

#### Parameters (all optional)

* `package_name`: Name of the GlusterFS package. Valid options: a string containing package name.
* `service_name`: Name of the GlusterFS service. Valid options: a string containing service name.
* `install_repo`: Specifies whether to install the GlusterFS repo. Valid options: 'true' and 'false'. Default: 'true'.
* `enable_repo`: Specifies whether to enable the GlusterFS repo. Valid options: 'true' and 'false'. Default: 'true'.
* `repo_url`: The URL of the GlusterFS package repo. Valid options: a string containing a URL.
* `repo_key_url`: The URL of the GlusterFS package repo public key. Valid options: a string containing a URL.
* `repo_key_check`: Specifies whether to validate GlusterFS package signatures. Valid options: 'true' and 'false'. Default: 'true'.

### Type: `glusterfs_pool`

Manages a GlusterFS pool

### Type: `glusterfs_vol`

Manages a GlusterFS volume

## Limitations

Currenly supporting RHEL based systems only.
