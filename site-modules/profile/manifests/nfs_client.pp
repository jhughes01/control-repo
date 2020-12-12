# base profile for common classes to be applied to all nodes
class profile::nfs_client {
  class { '::nfs':
      client_enabled => true,
  }

  nfs::client::mount { '/data/plex-media':
    ensure   => 'mounted',
    server   => 'storage',
    share    => '/volume1/plex-media',
    remounts => true,
    atboot   => true,
  }

  nfs::client::mount { '/data/plex-config':
    ensure   => 'mounted',
    server   => 'storage',
    share    => '/volume1/plex-config',
    remounts => true,
    atboot   => true,
  }
}
