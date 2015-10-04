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


The cron types documented below expect the Tarsnap binary to be
available at `/usr/bin/tarsnap`. If your binary is somewhere else, let
the module know first:

    class { 'tarsnap':
        path => '/usr/local/bin/tarsnap',
    }


### Cron jobs

For the sake of convenience the module provides a few defined types to
help you create cron jobs for Tarsnap:

- tarsnap::cron::hourly
- tarsnap::cron::daily
- tarsnap::cron::weekly
- tarsnap::cron::monthly

These are just small wrappers around [torrancew/cron](https://forge.puppetlabs.com/torrancew/cron)'s
defined types with two additional arguments:

#### `archive_name`

The name of the archive to be created.

#### `files`

A list of files to be included in the new archive.

#### `exclude`

A list of files to be excluded from the new archive.
