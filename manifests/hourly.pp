# Type: tarsnap::hourly
#
# This type creates an hourly cron job to run Tarsnap
#
# Parameters:
#   ensure - The state to ensure this resource exists in. Can be absent, present
#     Defaults to 'present'
#   archive_name - The base name of the archive
#   files - A list of files to include in the backup
#   minute - The minute the cron job should fire on. Can be any valid cron minute value.
#     Defaults to '0'.
#   environment - An array of environment variable settings.
#     Defaults to an empty set ([]).
#   user - The user the cron job should be executed as.
#     Defaults to 'root'.
#   mode - The mode to set on the created job file
#     Defaults to 0644.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   tarsnap::hourly {
#     'tarsnap hourly backup':
#      archive_name => '$(hostname -s)-$(date +%Y-%m-%d)'
#       files       => [
#         '/etc',
#         '/var',
#         '/home',
#       ]
#       minute      => '1',
#       environment => [ 'MAILTO="admin@example.com"' ],
#   }
define tarsnap::hourly(
  $files, $archive_name, $minute = 0, $hour = 0, $date = 1,
  $environment = [], $user = 'root', $mode = '0644', $ensure = 'present',
) {
  $joined = join($files, ' ')
  $command = "${::tarsnap::path} -c -f \"${archive_name}\" ${joined}"
  cron::hourly { $title:
    ensure      => $ensure,
    minute      => $minute,
    environment => $environment,
    user        => $user,
    mode        => $mode,
    command     => $command,
  }
}
