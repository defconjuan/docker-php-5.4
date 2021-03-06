class build::php54::extensions::apd {
  require build::php54

  file { '/tmp/pecl-apd-master.zip':
    ensure => present,
    source => 'puppet:///modules/build/tmp/pecl-apd-master.zip'
  }

  bash_exec { 'cd /tmp && unzip pecl-apd-master.zip':
    require => File['/tmp/pecl-apd-master.zip']
  }

  bash_exec { 'cd /tmp/pecl-apd-master && phpize-5.4.45':
    require => Bash_exec['cd /tmp && unzip pecl-apd-master.zip']
  }

  bash_exec { 'cd /tmp/pecl-apd-master && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-5.4.45':
    timeout => 0,
    require => Bash_exec['cd /tmp/pecl-apd-master && phpize-5.4.45']
  }

  bash_exec { 'cd /tmp/pecl-apd-master && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/pecl-apd-master && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-5.4.45']
  }

  bash_exec { 'cd /tmp/pecl-apd-master && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/pecl-apd-master && make']
  }
}
