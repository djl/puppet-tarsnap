# == Class: tarsnap::install
class tarsnap::install() inherits tarsnap::params {
  package { $tarsnap::package_name:
    ensure => $tarsnap::ensure,
  }
}
