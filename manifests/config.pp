class puppet::config (
	$confdir			= $puppet::confdir,
	$user					= $puppet::user,
	$group				= $puppet::group,
	$ssldir				= $puppet::ssldir,
	$vardir				= $puppet::vardir,
	$rundir				= $puppet::rundir,
	$options_hash	= $puppet::options_hash
	) inherits ::puppet {
	
	file { "${confdir}/puppet.conf":
			ensure	=> present,
			content	=> template("puppet/puppet.conf.erb"),
			owner		=> puppet,
			group		=> puppet,
			require	=> Class["puppet::install"],
			notify	=> Class["puppet::service"]
	}

	include puppet::config::puppetdb
	include puppet::config::routes
  include puppet::config::hiera
}
