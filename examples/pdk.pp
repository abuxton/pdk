# example with params

class{ '::pdk':
  $pdk_version      => 'latest', #not yet in use will come into it's own when we have versions to maintain
  $pdk_download_url => 'https://local/file/server',
}
