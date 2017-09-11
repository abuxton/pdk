# pdk
#
# Downloads the Puppet Development Toolkit (PDK) based on Fcater facts and version
# creates a local package file and installs from that file
# uses /tmp and will isntall as which ever user runs the types, so install local or shared global dependantly
# @summary installs the PDK
#
# @example
#   include pdk
class pdk(
  String $pdk_version = $pdk::params::pdk_version,
  String $pdk_download_url = $pdk::params::pdk_download_url,
  ) inherits pdk::params {

  $pdk_complete_download_url = "https://$pdk_download_url&ver=${pdk_version}"
  $pdk_local_source = "/tmp/pdk-$pdk_version.${::operatingsystem}${pdk::params::rel}.${pdk::params::pdk_pckg_format}"

  file{ $pdk_local_source:
    ensure => file,
    source => $pdk_complete_download_url,
  }
  package {'pdk':
    ensure => present,
    source => $pdk_local_source,
    subscribe  => File[$pdk_local_source],
  }
}
