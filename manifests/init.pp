# pdk
#
# Downloads the Puppet Development Toolkit (PDK) based on Fcater facts and version
# creates a local package file and installs from that file
# uses /tmp and will install as which ever user runs the types, so install local or shared global dependantly
# @summary installs the PDK
#
# @example
#   include pdk
class pdk(
  String $pdk_version = $pdk::params::pdk_version,
  String $pdk_download_url = $pdk::params::pdk_download_url,
  String $staging_dir = $pdk::params::staging_dir
  ) inherits pdk::params {

  $pdk_complete_download_url = "https://${pdk_download_url}&ver=${pdk_version}"
  $pdk_local_pkg = "pdk-${pdk_version}.${::operatingsystem}${pdk::params::rel}.${pdk::params::pdk_pkg_format}"

if !defined(Class['staging']){
  class { 'staging':
    path  => $staging_dir,
    #owner => 'puppet',
    #group => 'puppet',
  }
}
staging::file { $pdk_local_pkg :
  source => $pdk_complete_download_url,
}
  package {'pdk':
    ensure    => present,
    provider  => $pdk::params::provider,
    source    => "${staging_dir}/${module_name}/${pdk_local_pkg}",
    subscribe => Staging::File[$pdk_local_pkg],
  }
}
