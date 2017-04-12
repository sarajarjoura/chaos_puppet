$packages = ['python-setuptools', 'python-dev', 'build-essential', 'python-pip']
$pypackages = ['livereload', 'formic']

$packages.each |String $package| {
  package {"${package}":
    ensure => installed,
    provider => apt,
    name => "${package}"
  }
}

$pypackages.each |String $pypackage| {
  package {"${pypackage}":
    ensure => installed,
    provider => pip,
    name => "${pypackage}"
  }
}

service { 'apache2':
ensure => running,
   enable => false
}
