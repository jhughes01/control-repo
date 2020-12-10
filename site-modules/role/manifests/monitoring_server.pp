class role::monitoring_server {
  include profile::base
  include prometheus
  include prometheus::alertmanager
  include prometheus::snmp_exporter
  include profile::grafana
}
