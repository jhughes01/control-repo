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
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKmgan+aR+co+jQuEkeXBw8DurT8EALRyRwQ+Yvdj1Ugcx2YoazK4HTPbi23lKuuxQfdtituUkOMJccgFpT4pJrO9EsDM9CI7fuRuxvyqRNl0E7E4vcFLVeB8qoxVgq2/DXQ1BxPHtCtokCU+vyVYFFpu2e7+hGoDCHdn2lnaZB5Enqjmc+EM2yzuDro7HZFlnB/xjLoZsKKf9ev660OyQtcQ/3PGNfPkim7dPRd6LFEOS71X0kwgz86od/ZDapeJPVwlmDVk95GGq8yqKMw2V/uRsIGKbFUvYtSm/4zQZGelT+2S8mnWlUyaSq6ICnwuhET0sjnpXDNjdwjd+m3l3wbF+FxcROkPDCQTp5OUAxE9FPSPCz20z6RRktUwR/yjnHoJGMUBvUv+6viqYdYBwKEZ+pcYGJ/l5rFpRr22TwAwDRw3jnZveSwVW0h43Hx4Sx8FX5xlIqdep0I6wgALo26r9iJN3UgM/oeXGxfI4GKf7nQbO970ScSegsn3WORovOnkMjTwdDmhrKLS8Avu2746SiNDKIQnczI7JW7CxXShZXs1uOVdRXo7qDTKfZU5K9K3wN+ff82y+DC/lbNWwj7dr/zKRh8ppbmy17PRSlPyVlrSwKwHvBVjQ18ivL3wKwxceselVeUTifJuMO29v1T+2o6ZSTa5H+DPB9JlVsw== jhughes@orange',
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
