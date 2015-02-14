class php::extension::apcu {
  require php

  file { '/tmp/apcu-4.0.7.tgz':
    ensure => present,
    source => 'puppet:///modules/php/tmp/apcu-4.0.7.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf apcu-4.0.7.tgz':
    require => File['/tmp/apcu-4.0.7.tgz']
  }

  bash_exec { 'cd /tmp/apcu-4.0.7 && phpize-5.4.33':
    require => Bash_exec['cd /tmp && tar xzf apcu-4.0.7.tgz']
  }

  bash_exec { 'cd /tmp/apcu-4.0.7 && ./configure --with-php-config=/phpfarm/inst/bin/php-config-5.4.33':
    timeout => 0,
    require => Bash_exec['cd /tmp/apcu-4.0.7 && phpize-5.4.33']
  }

  bash_exec { 'cd /tmp/apcu-4.0.7 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/apcu-4.0.7 && ./configure --with-php-config=/phpfarm/inst/bin/php-config-5.4.33']
  }

  bash_exec { 'cd /tmp/apcu-4.0.7 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/apcu-4.0.7 && make']
  }
}
