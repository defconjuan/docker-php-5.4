class build::phpcs::coder {
  file { '/tmp/coder-7.x-2.6.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/coder-7.x-2.6.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf coder-7.x-2.6.tar.gz':
    require => File['/tmp/coder-7.x-2.6.tar.gz']
  }

  bash_exec { 'mv /tmp/coder /usr/local/src/coder7':
    require => Bash_exec['cd /tmp && tar xzf coder-7.x-2.6.tar.gz']
  }

  bash_exec { 'rm -rf /tmp/coder':
    require => Bash_exec['mv /tmp/coder /usr/local/src/coder7']
  }
}
