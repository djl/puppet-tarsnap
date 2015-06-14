define tarsnap::cron::monthly(
  $files, $archive_name, $minute = 0, $hour = 0, $date = 1,
  $environment = [], $user = 'root', $mode = '0644', $ensure = 'present',
) {
  $joined = join($files, ' ')
  $command = "${::tarsnap::path} -c -f \"${archive_name}\" ${joined}"
  ::cron::monthly { $title:
    ensure      => $ensure,
    minute      => $minute,
    hour        => $hour,
    date        => $date,
    environment => $environment,
    user        => $user,
    mode        => $mode,
    command     => $command,
  }
}
