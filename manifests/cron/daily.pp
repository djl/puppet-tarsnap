define tarsnap::cron::daily(
  $files, $archive_name, $exclude = [],
  $minute = 0, $hour = 0, $environment = [],
  $user = 'root', $mode = '0644', $ensure = 'present',
) {
  ::cron::daily { $title:
    ensure      => $ensure,
    minute      => $minute,
    hour        => $hour,
    environment => $environment,
    user        => $user,
    mode        => $mode,
    command     => template('tarsnap/cron.erb'),
  }
}
