class role::monitoring_server {
  include profile::base
  include prometheus
  include prometheus::alertmanager
  include profile::grafana
}
