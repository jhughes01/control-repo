# Site profile - grafana
class profile::grafana {
  class { 'grafana':
    cfg                      => {
      'auth.anonymous' => {
        enabled  => true,
        org_role => 'Admin',
        org_name => 'Main Org.',
      },
      'auth.basic'     => {
        enabled => false,
      },
      users            => {
        allow_sign_up => false,
      },
    },
    provisioning_datasources => {
      apiVersion  => 1,
      datasources => [
        {
          name      => 'Prometheus',
          type      => 'prometheus',
          url       => 'http://localhost:9090',
          access    => 'proxy',
          isDefault => true,
        },
      ],
    },
    provisioning_dashboards  => {
    apiVersion => 1,
    providers  => [
      {
        name            => 'Hardware Usage',
        type            => 'file',
        disableDeletion => true,
        options         => {
          path         => '/var/lib/grafana/dashboards',
          puppetsource => 'puppet:///modules/profile/dashboards',
        },
      },
    ],
    }
  }
}
