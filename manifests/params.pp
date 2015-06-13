# == Class: tarsnap::params
class tarsnap::params {
  $ensure           = 'present'
  $package_name     = 'tarsnap'
  $path             = '/usr/bin/tarsnap'
  $cachedir         = '/var/cache/tarsnap'
  $configfile       = '/etc/tarsnap.conf'
  $keyfile          = '/etc/tarsnap.key'
  $checkpoint_bytes = '1G'
  $humanize_numbers = true
  $nodump           = true
  $print_stats      = true
}
