# base profile for common classes to be applied to all nodes
class profile::base {
  include linuxusers
  include puppetcron
  include firewalld
}
