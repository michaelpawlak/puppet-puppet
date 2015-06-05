class puppet (
  $packages         = $puppet::params::packages,
  $user             = 'puppet',
  $group            = 'puppet',
  $groups           = undef,
  $shell            = $puppet::params::shell,
  $confdir          = '/etc/puppet',
  $vardir           = '/var/lib/puppet',
  $ssldir           = '$confdir/ssl',
  $rundir           = '$vardir/run', 
  $options_hash     = $puppet::params::options,
  $puppet_db_port   = '8081',
  $puppet_db_server = undef,
  $routes_source    = undef,
  $routes_hash      = undef,
  $hiera_hash       = undef,
  $hiera_source     = undef,
  $service_enable   = true,
  $service_ensure   = 'running'
  ) inherits ::puppet::params {

	include puppet::install
  include puppet::user
	include puppet::config
  include puppet::service
}