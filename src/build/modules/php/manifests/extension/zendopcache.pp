class php::extension::zendopcache {
  require php

  file { '/tmp/zendopcache-7.0.3.tgz':
    ensure => present,
    source => 'puppet:///modules/php/tmp/zendopcache-7.0.3.tgz'
  }

  exec { 'tar xzf zendopcache-7.0.3.tgz':
    cwd => '/tmp',
    path => ['/bin'],
    require => File['/tmp/zendopcache-7.0.3.tgz']
  }

  exec { 'phpize-5.4.33 opcache':
    command => '/phpfarm/inst/bin/phpize-5.4.33',
    cwd => '/tmp/zendopcache-7.0.3',
    require => Exec['tar xzf zendopcache-7.0.3.tgz']
  }

  exec { '/bin/su - root -c "cd /tmp/zendopcache-7.0.3 && ./configure --with-php-config=/phpfarm/inst/bin/php-config-5.4.33"':
    timeout => 0,
    require => Exec['phpize-5.4.33 opcache']
  }

  exec { '/bin/su - root -c "cd /tmp/zendopcache-7.0.3 && make"':
    timeout => 0,
    require => Exec['/bin/su - root -c "cd /tmp/zendopcache-7.0.3 && ./configure --with-php-config=/phpfarm/inst/bin/php-config-5.4.33"']
  }

  exec { '/bin/su - root -c "cd /tmp/zendopcache-7.0.3 && make install"':
    timeout => 0,
    require => Exec['/bin/su - root -c "cd /tmp/zendopcache-7.0.3 && make"']
  }
}
