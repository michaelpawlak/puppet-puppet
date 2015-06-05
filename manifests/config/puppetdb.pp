class puppet::config::puppetdb (
	$server	= $puppet::puppet_db_server,
	$port		= $puppet::puppet_db_port
	) inherits ::puppet::config {
	
	if $server {
		file { "${confdir}/puppetdb.conf":
			ensure	=> present,
			content	=> template("puppet/puppetdb.conf.erb"),
			owner		=> puppet,
			group		=> puppet,
			require	=> Class['puppet::install'],
			notify	=> Class['puppet::service']
		}
	}
}