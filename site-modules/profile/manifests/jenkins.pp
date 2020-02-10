# Site specific Jenkins config
class profile::jenkins {
  # jenkins::plugin { 'mailer': }
  # jenkins::plugin { 'display-url-api version':
  #   version => '2.3.2',
  # }

  # jenkins::user { 'admin':
  #   email    => 'admin@fake.com',
  #   password => 'changeme',
  # }
  jenkins::plugin { 'git': }

  jenkins::job { 'packer-centos7':
  config => template('profile/jenkins/jenkins-packer-centos7.xml.epp'),
  }
}
