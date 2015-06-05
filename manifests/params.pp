class puppet::params {
  $options_hash = {
    'report'                => 'true',
    'reports'               => 'store',
    'environmentpath'       => 'false',
    'moduledir'             => [
      '$confdir/modules',
      '$vardir/modules'
    ],
    'storeconfigs'          => 'false',
    'storeconfigs_backend'  => 'false',
    'parser'                => 'future',
    'pluginsync'            => 'true'
  }
  case $::osfamily {
    'Debian': {
      $shell      = '/usr/sbin/nologin'
      $packages   = ['puppet', 'hiera', 'facter',
                     'puppet-common', 'ruby-hiera']
    }
    'RedHat': {
      $shell      = '/sbin/nologin'
      $packages   = ['puppet', 'hiera', 'facter',
                     'puppetdb-terminus']
    }
    default: {
      fail("osfamily ${::osfamily} not supported")
    }
  }
}