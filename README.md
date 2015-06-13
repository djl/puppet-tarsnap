# Tarsnap

Installs and configures Tarsnap. Optionally creates cron jobs for
running Tarsnap.


### Usage

To just install Tarsnap with the default config:

    class { 'tarsnap': }
    # or
    include ::tarsnap

This assumes you have a package named `tarsnap` available in your
package manager. You can specify a different package name:

    class { 'tarsnap':
        package_name => 'my-tarsnap',
    }

By default the module will create a config file at `/etc/tarsnap.conf`
and expects your key to be available at `/etc/tarsnap.key`. This can
be changed:

    class { 'tarsnap':
        configfile => '/path/to/tarsnap.conf',
        keyfile    => '/path/to/tarsnap.key',
    }


For the sake of conveience the module profides a few defined types to
help you create cron jobs for Tarsnap:

- tarsnap::hourly
- tarsnap::daily
- tarsnap::weekly
- tarsnap::monthly

These are just small wrappers around [torrancew/cron](https://forge.puppetlabs.com/torrancew/cron)'s
defined types. See [the docs](https://forge.puppetlabs.com/torrancew/cron/readme) for
more details.



Examples:

    tarsnap::monthly { 'tarsnap-monthly':
      archive_name => "$(date +%Y-%m-%d)"
      files        => [
        '/etc,
        '/home',
        '/var,
      ]
    }

    tarsnap::daily { 'tarsnap-dailies':
      archive_name => "$(date +%Y-%m-%d)"
      files        => [
        '/home',
        '/var/etc',
      ]
    }
