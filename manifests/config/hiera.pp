class puppet::config::hiera (
  $config_hash    = $puppet::hiera_hash,
  $config_source  = $puppet::hiera_source
  ) inherits ::puppet::config {
  
  if $config_hash or $config_source {
    if $config_hash {
      validate_hash($config_hash)
      file { "${confdir}/hiera.yaml":
        ensure  => present,
        content => template("puppet/hiera.yaml.erb"),
        owner   => puppet,
        group   => puppet,
        require => Class['puppet::install'],
        notify  => Class['puppet::service']
      }
    }
    else {
      file { "${confdir}/hiera.yaml":
        ensure  => present,
        source  => $config_source,
        owner   => puppet,
        group   => puppet,
        require => Class['puppet::install'],
        notify  => Class['puppet::service']
      }
    }
  }
}