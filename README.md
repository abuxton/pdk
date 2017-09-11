
# pdk

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with pdk](#setup)
    * [What pdk affects](#what-pdk-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pdk](#beginning-with-pdk)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

Module to installl the Puppet Development Kit when you are using a Puppetized node as a workstation.

For more information on the PDK, https://docs.puppet.com/pdk/1.0/#getting-started or the list of supported platforms. https://puppet.com/download-puppet-development-kit

## Setup

### What pdk affects **OPTIONAL**

installs the Puppet PDK in the default manner

### Setup Requirements **OPTIONAL**

Puppet installed,

### Beginning with pdk

Simply
```
include pdk
```
The module uses Facter to determine the platform.
## Usage

N/A

## Reference


## Limitations

The PDK has it's own prerequisites for usage and support of Puppet language.

### TODO
Provide support for following OS's
* SLES
* Windows

## Development



## Release Notes/Contributors/Etc. **Optional**
