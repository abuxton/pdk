# params class for pdk to compute the download url
# https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=el&rel=7&arch=x86_64&ver=latest
# https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=$fact[]&rel=7&arch=x86_64&ver=latest
# $pdk_download_url encapsulated by operatingsystem case due to requirment for fully formed url for windows being diferent components to other osfamilys
class pdk::params{

$base_download_url = 'pm.puppetlabs.com/cgi-bin/pdk_download.cgi?'
$pdk_version = 'latest'
  case $::operatingsystem {
    /^(RedHat|CentOS|Scientific|OracleLinux)$/: {
        $dist = 'el'
        $rel = "${operatingsystemmajrelease}.${minor}"
        $pdk_download_url = "${base_download_url}dist=${dist}&rel=${rel}&arch=${::architecture}"
    }
    'Darwin' : {
      $dist ='osx'
      $rel = $macosx_productversion_major
      $pdk_download_url = "${base_download_url}dist=${dist}&rel=${rel}&arch=${::architecture}"
      $pdk_pckg_format = 'dmg'
    }
    'Debian':{
      $dist = 'debian'
      $rel = "${operatingsystemmajrelease}.${minor}"
      $pdk_download_url = "${base_download_url}dist=${dist}&rel=${rel}&arch=${::architecture}"
    }
    default :{
      fail ("$osfamily is not supported by the $module_name module")
    }
  }

}
