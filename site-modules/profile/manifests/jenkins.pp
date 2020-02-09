# Site specific Jenkins config
class profile::jenkins {
  jenkins::plugin { 'mailer': }
  jenkins::plugin { 'display-url-api version': }

  jenkins::user { 'admin':
    email    => 'admin@fake.com',
    password => 'changeme',
  }
}
