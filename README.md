
# pdk

#### Table of Contents

- [pdk](#pdk)
      - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [What pdk affects **OPTIONAL**](#what-pdk-affects-optional)
    - [Setup Requirements **OPTIONAL**](#setup-requirements-optional)
    - [Beginning with pdk](#beginning-with-pdk)
  - [Usage](#usage)
  - [Reference](#reference)
  - [Limitations](#limitations)
    - [TODO](#todo)
  - [Development](#development)
  - [Release Notes/Contributors/Etc.](#release-notescontributorsetc)

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

## Development



## Release Notes/Contributors/Etc. 

* Helen Griffiths   https://github.com/threepistons
* Kevin Reeuwijk    https://github.com/kreeuwijk
* Jaime Mickelson   http://github.com/jmick44
* msurato           https://github.com/msurato
  
