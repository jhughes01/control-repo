# base profile for common classes to be applied to all nodes
class profile::base {
  # include puppetcron
  include accounts
  include sudo
  include firewalld
  include prometheus::node_exporter
  include epel

  accounts::user { 'jhughes':
  groups  => [
    'wheel',
  ],
  sshkeys => [
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCv28Vb5+CmPeoJoE4d4m7JfeYenCsOM7oRON8XC7qyM4azBzZdPcguF1wIVBsyw+CeBe0ycA/PNPzDIKls7Zms/uz/5N/PbEANOSV4gOj7hHfIF7+DSu0p/Pkz7t/nGRR2KkKEWcXOlWwy8SXAl/oxkxqYZ9sY+0nnNN8zjer6u4VrEFIPy/bKpDyvAJmn/werK69CJST6ii5kocgxNSxL4qOI0eILaygFGJtFfNc4b2LBp/PgqZ9+8N5j5YkvSQoKoBkztWvMnnxpoiziLjPWYrc1A8u/0kSZIImEA+QfJT9Uk5wldKeQEyto3zI+9VJjV41m5ZBrv9dEVt9LIgXRjWB8fZdJbzmcrXfcizIp6aO9spm6j2ufXygs2qJZU9A+7e20DGDhbtRdf3bNRRL9+yAukxYr5hX8iCHAiTOyEw9A402rJ9GqWsgcbhO86Cbub6L1S9nDAI8qpPx7SoRKXhg/DAg7PT/4onYZ+OHdokK/kpR+MDkagjGaqjShC/k0No3s6ljw8azQCqgxinrX1ANLxHX1m5vqUMpmXPEOo12lwVfhCuobiCE0r1kCZE/0aRplFJ7Ealwr2XrCpFq3YPhhYoYyHwIfrsiEIZmoer7DoxMRfeRdu4DyNQvgmdxbqi2O1XY3CKgH0sMKpiyZ8hGIqVamiqdT/o2aaxfbQw== jackson@carbon',
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCirgfx1x7RtJj9De/foPMEoWmatgcunQtLGIPixtHI7JHHoAMK10bKNjmfEyWSNHWuo7cD3Gbyas45/JUIVWcizOnETS4f2HF2g+yjlOh72E4rGB2ZyivaEIgadRTnsgshkCWKsNpn4AldMaJAmHQUHXzBVgIzwPP/qEaZC5wUCF0vav7Qksjcb2uBkiUoFi1lDe2eU3GvYRPk4hnG/GDGEu2OPoxicSGbUYLZ02YCoIq/ZRFoFHbCB9dtpJdZxcErN1fyO4rMlP7tFPzwXfIWLfu7zRqCwq+qMvmn1DlFukzGmZH0flA5iKaGJu7SOB9djYBl2+umPGH+4/aROi5vhgPS9mwMNKRVMkAr8D+qWiL94oMOb2AbXUcB7rDdPisjMGmSIvfGA9x7ghRYY30emdFXk00HmkJDDY4zoKh+A1YCGu2UznuANoe8JtjI5+Ql4KakfQhmL+eDe7H3oRP09zvQciAfYhe8/ew2seRvVN/WOYBpbyf0IxgKdBzJBfey9WrQYAy2xbEr9aOpB2mO+nI6i4vEjMdK7zvW5WehUUgMqlF1x1zORxbnxSyYykntMD3aczoWZvNfDvABH/1+d0Dj1vLX/aL1Sy9XHf4Rs06r91E0591ndYZs6GnSrfljkTOfotVmsz5ZRO3cwxYtSfn+lIuBqK2aUUB62YpqDw== jhughes-windows',
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyUeJsGltXIHe1/XJKobiVXwNOz/Mm5r5A9HVEsPU2PfjrNPNJTDh4105jDVssGL4J1JJH5U0RJ5G83QuSyCpSPVMYu5ySMu4fp2qUNBGj0hiYDovJdpkv7rol4VfZV/622niSpEEx4jcvMgHXEbzd5d9oXnOQlPEqO9AO0VxP75mlDxLF30IC9gr9L2yoIJBtODWfbhvgtr4mhwVPPKluj6bIA2tZesbJ1Ycs5HCFIqfTP51kayTLmitp0Kgv5Ed1NUFatPthOKJBO8699IeEKgl/grCpPtuZli9+HlAHk5l7IF9WHc3Px8gaPMUnbkTlafB+8LyutNxC776nH1N/Z31g2Z9GqE86cBbQ6hd04CTkxFVUmgK6g3PvmjTmMHRAzlhTbVDsyL2mJzW1+hk9ut3JHHeHoBcFcdaLm83lvaYjfHFjGKApSUzTUK5E7BihH1ByK5xh8FOpVNBXcUx0bAyv+TkhFtGUSezvbp7yh9whbRM2tqu173WvcNttP7Y17nO24Vg838RSzs8IIiFO8MCW2vAWkdpAZXvq8clxYqfdcDTA0SUUzlYVGyL5rY87WzGrvS3LSiy1vvu0lOWM09Sd0Nj3rM9Am3k5NZFBAvknxN1CGTtAJZNKZuUUgNY8j8CXRs7+jc0TYWKDcVtje2uAaY6RGnHoDVhtgE+KcQ== JH Desktop WSL2',
    ],
  }

  file { '/etc/puppetlabs/r10k':
    ensure => 'directory'
  }

  file { '/etc/puppetlabs/r10k/r10k.yaml':
    ensure => 'file',
    source => 'puppet:///modules/profile/r10k.yaml'
  }
}
