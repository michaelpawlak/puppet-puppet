class puppet::config::routes (
	$config_source	= $puppet::routes_source,
	$config_hash		= $puppet::routes_hash
	) inherits ::puppet::config {
	
	if $config_hash or $config_source {
		if $config_hash {
			validate_hash($config_hash)
			file { "${confdir}/routes.yaml":
				ensure	=> present,
				content	=> template("puppet/routes.yaml.erb"),
				owner		=> puppet,
				group		=> puppet,
				require	=> Class['puppet::install'],
				notify	=> Class['puppet::service']
			}
		}
		else {
			file { "${confdir}/routes.yaml":
				ensure	=> present,
				source	=> $config_source,
				owner		=> puppet,
				group		=> puppet,
				require	=> Class['puppet::install'],
				notify	=> Class['puppet::service']
			}
		}
	}
}