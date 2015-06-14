define tarsnap::cron::weekly(
  $files, $archive_name, $minute = 0, $hour = 0, $weekday = 0,
  $environment = [], $user = 'root', $mode = '0644', $ensure = 'present',
) {
  $joined = join($files, ' ')
  $command = "${::tarsnap::path} -c -f \"${archive_name}\" ${joined}"
  ::cron::weekly { $title:
    ensure      => $ensure,
    minute      => $minute,
    hour        => $hour,
    weekday     => $weekday,
    environment => $environment,
    user        => $user,
    mode        => $mode,
    command     => $command,
  }
}
