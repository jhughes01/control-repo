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

  docker_network { 'monitoring':
    ensure => present,
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
    ports           => ['9090:9090'],
    net             => ['monitoring'],
    volumes         => [
      '/opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml',
      '/opt/prometheus/alerting-rules.yml:/etc/prometheus/alerting-rules.yml',
      ],
    restart_service => true,
    subscribe       => File['/opt/prometheus/prometheus.yml', '/opt/prometheus/alerting-rules.yml']
  }

  file { [
    '/opt/grafana',
    '/opt/grafana/config',
    '/opt/grafana/dashboards',
    ]:
    ensure => 'directory',
  }

  file { '/opt/grafana/config/grafana.ini':
    ensure => 'file',
    source => 'puppet:///modules/profile/grafana.ini'
  }

  file { '/opt/grafana/config/dashboards.yml':
    ensure => 'file',
    source => 'puppet:///modules/profile/dashboards.yml'
  }

  file { '/opt/grafana/config/datasources.yml':
    ensure => 'file',
    source => 'puppet:///modules/profile/datasources.yml'
  }

  file { '/opt/grafana/dashboards/hardwareusage.json':
    ensure => 'file',
    source => 'puppet:///modules/profile/dashboards/hardwareusage.json'
  }

  docker::run { 'grafana':
    image           => 'grafana/grafana:7.3.6',
    ports           => ['3000:3000'],
    net             => ['monitoring'],
    volumes         => [
      '/opt/grafana/config/dashboards.yml:/etc/grafana/provisioning/dashboards/dashboards.yml',
      '/opt/grafana/config/datasources.yml:/etc/grafana/provisioning/datasources/datasources.yml',
      '/opt/grafana/config/grafana.ini:/etc/grafana/grafana.ini',
      '/opt/grafana/dashboards/hardwareusage.json:/var/lib/grafana/dashboards/hardwareusage.json',
      ],
    restart_service => true,
    subscribe       => File[
      '/opt/grafana/config/dashboards.yml',
      '/opt/grafana/config/datasources.yml',
      '/opt/grafana/config/grafana.ini',
      '/opt/grafana/dashboards/hardwareusage.json',
      ]
  }
}
