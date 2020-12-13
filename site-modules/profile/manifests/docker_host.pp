# docker host profile
class profile::docker_host {
  include docker
  include docker::run_instance

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

  nfs::client::mount { '/data/media-config':
    ensure   => 'mounted',
    server   => 'storage',
    share    => '/volume1/media-conf',
    remounts => true,
    atboot   => true,
  }

  class {'docker::compose':
    ensure => present,
  }

  file { '/tmp/docker-compose.yaml':
    ensure => 'file',
    source => 'puppet:///modules/profile/docker-compose-files/media-stack-compose.yaml'
  }

  docker_compose { 'media-stack':
    ensure        => present,
    compose_files => ['/tmp/docker-compose.yaml'],
    subscribe     => File['/tmp/docker-compose.yaml'],
  }

  file { '/opt/prometheus':
    ensure => 'directory',
  }

  file { '/opt/prometheus/prometheus.yml':
    ensure => 'file',
    source => 'puppet:///modules/profile/prometheus.yml'
  }

  file { '/opt/prometheus/alerting-rules.yml':
    ensure => 'file',
    source => 'puppet:///modules/profile/alerting-rules.yml'
  }

  docker::run { 'prometheus':
    image           => 'prom/prometheus',
    ports           => ['9090', '9090'],
    volumes         => ['/opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml'],
    restart_service => true,
    subscribe       => File['/opt/prometheus/prometheus.yml', '/opt/prometheus/alerting-rules.yml']
  }
}
