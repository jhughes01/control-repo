class profile::grafana {
  class { 'grafana':
    cfg => {
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
  }
}
