# params class for pdk to compute the download url
# https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=el&rel=7&arch=x86_64&ver=latest
# https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=$fact[]&rel=7&arch=x86_64&ver=latest
# $pdk_download_url encapsulated by operatingsystem case due to requirement for fully formed urls for windows
# and  being different components to other osfamilys
class pdk::params{

$staging_dir = '/tmp/staging'
$base_download_url = 'pm.puppetlabs.com/cgi-bin/pdk_download.cgi?'

$pdk_version = 'latest'
  case $::operatingsystem {
    /^(RedHat|CentOS|Scientific|OracleLinux)$/: {
        $dist = 'el'
        $rel = $::operatingsystemmajrelease
        $pdk_download_url = "${base_download_url}dist=${dist}&rel=${rel}&arch=${::architecture}"
        $pdk_pkg_format = 'rpm'
        $provider = 'rpm'
    }
    'Darwin' : {
      $dist ='osx'
      $rel = $::macosx_productversion_major
      $pdk_download_url = "${base_download_url}dist=${dist}&rel=${rel}&arch=${::architecture}"
      $pdk_pkg_format = 'dmg'
      $provider = 'appdmg'
    }
    'Ubuntu':{
      $dist = 'ubuntu'
      $rel = $facts[os][release][full]
      $pdk_download_url = "${base_download_url}dist=${dist}&rel=${rel}&arch=${::architecture}"
      $pdk_pkg_format = 'deb'
      $provider = 'dpkg'
    }
    default :{
      fail ("$osfamily is not supported by the $module_name module")
    }
  }

}
