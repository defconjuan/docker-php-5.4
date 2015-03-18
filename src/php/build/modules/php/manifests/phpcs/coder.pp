class php::phpcs::coder {
  file { '/tmp/coder-6.x-2.0-rc1.tar.gz':
    ensure => present,
    source => 'puppet:///modules/php/tmp/coder-6.x-2.0-rc1.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf coder-6.x-2.0-rc1.tar.gz':
    require => File['/tmp/coder-6.x-2.0-rc1.tar.gz']
  }

  bash_exec { 'mv /tmp/coder /usr/local/src/coder6':
    require => Bash_exec['cd /tmp && tar xzf coder-6.x-2.0-rc1.tar.gz']
  }

  bash_exec { 'rm -rf /tmp/coder':
    require => Bash_exec['mv /tmp/coder /usr/local/src/coder6']
  }

  file { '/tmp/coder-7.x-2.4.tar.gz':
    ensure => present,
    source => 'puppet:///modules/php/tmp/coder-7.x-2.4.tar.gz',
    require => Bash_exec['rm -rf /tmp/coder']
  }

  bash_exec { 'cd /tmp && tar xzf coder-7.x-2.4.tar.gz':
    require => File['/tmp/coder-7.x-2.4.tar.gz']
  }

  bash_exec { 'mv /tmp/coder /usr/local/src/coder7':
    require => Bash_exec['cd /tmp && tar xzf coder-7.x-2.4.tar.gz']
  }
}
