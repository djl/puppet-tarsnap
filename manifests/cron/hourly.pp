define tarsnap::cron::hourly(
  $files, $archive_name, $exclude = [],
  $minute = 0, $hour = 0, $date = 1,
  $environment = [], $user = 'root', $mode = '0644', $ensure = 'present',
) {
  ::cron::hourly { $title:
    ensure      => $ensure,
    minute      => $minute,
    environment => $environment,
    user        => $user,
    mode        => $mode,
    command     => template('tarsnap/cron.erb'),
  }
}
