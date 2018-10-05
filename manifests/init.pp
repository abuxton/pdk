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
  Enum['String','latest','present','absent','purged','installed'] $pdk_version = $pdk::params::pdk_version,
  Optional[String] $pdk_download_url = $pdk::params::pdk_download_url,
  Optional[String] $staging_dir = $pdk::params::staging_dir,
  ) inherits pdk::params {

    case $facts['operatingsystem'] {
      'windows' : {
        package {'pdk':
        ensure   => $pdk_version,
        provider => $pdk::params::provider,
        source   => $pdk_download_url,
      }
    }
    default: {
      $pdk_complete_download_url = "https://${pdk_download_url}&ver=${pdk_version}"
      $pdk_local_pkg = "pdk-${pdk_version}.${::operatingsystem}${pdk::params::rel}.${pdk::params::pdk_pkg_format}"

      archive { "${staging_dir}/${pdk_local_pkg}" :
        source => $pdk_complete_download_url,
      }
      
      package {'pdk':
        ensure    => $pdk_version,
        provider  => $pdk::params::provider,
        source    => "${staging_dir}/${pdk_local_pkg}",
        subscribe => Archive["${staging_dir}/${pdk_local_pkg}"],
      }
    }
  }
}
