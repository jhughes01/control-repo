# base profile for common classes to be applied to all nodes
class profile::base {
  include puppetcron
  include accounts
  include sudo
  include firewalld
  include prometheus::node_exporter

  accounts::user { 'jhughes':
  groups  => [
    'wheel',
  ],
  sshkeys => [
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKmgan+aR+co+jQuEkeXBw8DurT8EALRyRwQ+Yvdj1Ugcx2YoazK4HTPbi23lKuuxQfdtituUkOMJccgFp\
    T4pJrO9EsDM9CI7fuRuxvyqRNl0E7E4vcFLVeB8qoxVgq2/DXQ1BxPHtCtokCU+vyVYFFpu2e7+hGoDCHdn2lnaZB5Enqjmc+EM2yzuDro7HZFlnB/xjLoZsK\
    Kf9ev660OyQtcQ/3PGNfPkim7dPRd6LFEOS71X0kwgz86od/ZDapeJPVwlmDVk95GGq8yqKMw2V/uRsIGKbFUvYtSm/4zQZGelT+2S8mnWlUyaSq6ICnwuhET\
    0sjnpXDNjdwjd+m3l3wbF+FxcROkPDCQTp5OUAxE9FPSPCz20z6RRktUwR/yjnHoJGMUBvUv+6viqYdYBwKEZ+pcYGJ/l5rFpRr22TwAwDRw3jnZveSwVW0h4\
    3Hx4Sx8FX5xlIqdep0I6wgALo26r9iJN3UgM/oeXGxfI4GKf7nQbO970ScSegsn3WORovOnkMjTwdDmhrKLS8Avu2746SiNDKIQnczI7JW7CxXShZXs1uOVdR\
    Xo7qDTKfZU5K9K3wN+ff82y+DC/lbNWwj7dr/zKRh8ppbmy17PRSlPyVlrSwKwHvBVjQ18ivL3wKwxceselVeUTifJuMO29v1T+2o6ZSTa5H+DPB9JlVsw==\
     jhughes@orange',
    'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCirgfx1x7RtJj9De/foPMEoWmatgcunQtLGIPixtHI7JHHoAMK10bKNjmfEyWSNHWuo7cD3Gbyas45/JUI\
    VWcizOnETS4f2HF2g+yjlOh72E4rGB2ZyivaEIgadRTnsgshkCWKsNpn4AldMaJAmHQUHXzBVgIzwPP/qEaZC5wUCF0vav7Qksjcb2uBkiUoFi1lDe2eU3GvYR\
    Pk4hnG/GDGEu2OPoxicSGbUYLZ02YCoIq/ZRFoFHbCB9dtpJdZxcErN1fyO4rMlP7tFPzwXfIWLfu7zRqCwq+qMvmn1DlFukzGmZH0flA5iKaGJu7SOB9djYBl\
    2+umPGH+4/aROi5vhgPS9mwMNKRVMkAr8D+qWiL94oMOb2AbXUcB7rDdPisjMGmSIvfGA9x7ghRYY30emdFXk00HmkJDDY4zoKh+A1YCGu2UznuANoe8JtjI5+\
    Ql4KakfQhmL+eDe7H3oRP09zvQciAfYhe8/ew2seRvVN/WOYBpbyf0IxgKdBzJBfey9WrQYAy2xbEr9aOpB2mO+nI6i4vEjMdK7zvW5WehUUgMqlF1x1zORxbn\
    xSyYykntMD3aczoWZvNfDvABH/1+d0Dj1vLX/aL1Sy9XHf4Rs06r91E0591ndYZs6GnSrfljkTOfotVmsz5ZRO3cwxYtSfn+lIuBqK2aUUB62YpqDw=='
  ],
}
}
