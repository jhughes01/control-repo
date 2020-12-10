class role::docker_host {
  include profile::base
  include docker
  include docker::run_instance
  include docker::volumes
}
