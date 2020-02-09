# Site specific Jenkins config
class profile::jenkins {
  jenkins::plugin { 'mailer': }

  jenkins::user { 'admin':
    email    => 'admin@fake.com',
    password => 'changeme',
  }
}
