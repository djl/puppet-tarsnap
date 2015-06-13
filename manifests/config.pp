# == Class: tarsnap::config
class tarsnap::config {
  file { $tarsnap::cachedir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { $tarsnap::configfile:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('tarsnap/config.erb'),
  }
}
