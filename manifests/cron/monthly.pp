define tarsnap::cron::monthly(
  $files, $archive_name, $exclude = [],
  $minute = 0, $hour = 0, $date = 1,
  $environment = [], $user = 'root', $mode = '0644', $ensure = 'present',
) {
  ::cron::monthly { $title:
    ensure      => $ensure,
    minute      => $minute,
    hour        => $hour,
    date        => $date,
    environment => $environment,
    user        => $user,
    mode        => $mode,
    command     => template('tarsnap/cron.erb'),
  }
}
