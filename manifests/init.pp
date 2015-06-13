# == Class: tarsnap
#
# Install Tarsnap
#
# === Parameters
#
# [*ensure*]
#   Ensure the package is either `present`, `absent` or `latest`.
#   (Default: `present`)
#
# [*package_name*]
#   The Tarsnap package name (Default: `tarsnap`)
#
# [*path*]
#   Path to the Tarsnap binary (Default: `/usr/bin/tarsnap`)
#
# [*cachedir*]
#   Path to Tarsnap cache directory (Default: `/var/cache/tarsnap`)
#
# [*configfile*]
#   Path to Tarsnap config file (Default: `/etc/tarsnap.conf`)
#
# [*keyfile*]
#   Path to Tarsnap key file (Default: `/etc/tarsnap.key`)
#
# [*checkpoint_bytes*]
#   The checkpoint threshold (Default `1G`)
#
# [*humanize_numbers*]
#   Use SI prefixes to make numbers printed by `print-stats` more readable.
#
# [*nodump*]
#   Honor the nodump file flag by skipping this file (default: `true`)
#
# [*print_stats*]
#   Print statistics for the archive being created (default: `true`)
#
class tarsnap (
  $ensure           = $tarsnap::params::ensure,
  $package_name     = $tarsnap::params::package_name,
  $path             = $tarsnap::params::path,
  $cachedir         = $tarsnap::params::cachedir,
  $configfile       = $tarsnap::params::configfile,
  $keyfile          = $tarsnap::params::keyfile,
  $checkpoint_bytes = $tarsnap::params::checkpoint_bytes,
  $humanize_numbers = $tarsnap::params::humanize_numbers,
  $nodump           = $tarsnap::params::nodump,
  $print_stats      = $tarsnap::params::nodump,
) inherits tarsnap::params {

  validate_absolute_path($path)
  validate_absolute_path($cachedir)
  validate_absolute_path($configfile)
  validate_absolute_path($keyfile)

  validate_bool($humanize_numbers)
  validate_bool($nodump)
  validate_bool($print_stats)

  class { 'tarsnap::install': } ->
  class { 'tarsnap::config': } ~>
  Class['tarsnap']
}
