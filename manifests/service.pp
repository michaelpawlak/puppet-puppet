class puppet::service (
	$ensure	= $puppet::service_ensure,
	$enable	= $puppet::service_enable
  ) inherits ::puppet {

	service { "puppet":
		ensure	=> $ensure,
		enable	=> $enable,
		require	=> Class["puppet::install"],
	}
}
