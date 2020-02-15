class role::monitoring_server {
  include prometheus
  include profile::grafana
}
