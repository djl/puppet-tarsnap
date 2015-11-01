define tarsnap::cron::weekly(
  $files, $archive_name, $exclude = [],
  $minute = 0, $hour = 0, $weekday = 0,
  $environment = [], $user = 'root', $mode = '0644', $ensure = 'present',
) {
  ::cron::weekly { $title:
    ensure      => $ensure,
    minute      => $minute,
    hour        => $hour,
    weekday     => $weekday,
    environment => $environment,
    user        => $user,
    mode        => $mode,
    command     => template('tarsnap/cron.erb'),
  }
}
