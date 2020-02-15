class role::monitoring_server {
  include prometheus
  include prometheus::alertmanager
  include profile::grafana
}
