# base profile for common classes to be applied to all nodes
class profile::base {
  include puppetcron
  include firewalld
  include prometheus::node_exporter
}
