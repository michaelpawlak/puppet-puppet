class puppet::user (
	$puppet_home		= $puppet::vardir,
	$puppet_user		= $puppet::user,
	$puppet_group		= $puppet::group,
	$puppet_groups	= $puppet::groups,
	$user_shell			= $puppet::shell ) inherits ::puppet {

	group { "${puppet_group}":
		ensure	=> 'present'
	}

	user { "${puppet_user}":
		ensure		=> 'present',
		home 			=> $puppet_home,
		gid				=> $puppet_group,
		groups 		=> $puppet_groups,
		shell 		=> $user_shell,
		password	=> '*',
		comment		=> 'Puppet user',
		require		=> Group["${puppet_group}"]
	}

	file { "${puppet_home}":
		ensure	=> 'directory',
		mode		=> '0750',
		owner		=> $puppet_user,
		group		=> $puppet_group
	}
}