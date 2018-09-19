# example for install under Windows

class { 'pdk' :
  pdk_version      => 'installed', #supports same as Package resource ensure
  pdk_download_url => 'undef', #supports source as a http/s url for a choco stream
  staging_dir      => undef, #not required or used for windows install
}
