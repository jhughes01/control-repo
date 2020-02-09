# Site specific Jenkins config
class profile::jenkins {
  jenkins::user { 'admin':
    email    => 'admin@fake.com',
    password => 'changeme',
  }
}
