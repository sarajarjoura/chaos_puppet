package {"python-setuptools":
  ensure => installed,
  provider => apt,
  name => "python-setuptools",
  notify => [
    Package['python-pip']
  ]
}

package {"python-dev":
  ensure => installed,
  provider => apt,
  name => "python-dev",
  notify => [
    Package['python-pip']
  ]
}

package {"build-essential":
  ensure => installed,
  provider => apt,
  name => "build-essential",
  notify => [
    Package['python-pip']
  ]
}

package {"python-pip":
  ensure => installed,
  provider => apt,
  name => "python-pip",
  require => [
    Package['python-setuptools'],
    Package['python-dev'],
    Package['build-essential']
  ],
  notify => [
    Package['livereload'],
    Package['formic']
  ]
}

package {"livereload":
  ensure => installed,
  provider => pip,
  name => "livereload",
  require => [
    Package['python-pip']
  ]
}

package {"formic":
  ensure => installed,
  provider => pip,
  name => "formic",
  require => [
    Package['python-pip']
  ]
}

service { 'apache2'
  name => 'apache2',
  ensure => running,
  enable => true
}
