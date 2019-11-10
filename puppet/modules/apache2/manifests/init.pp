# Install Apache

class apache2::install {

  File {
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['apache2'],
    notify  => Service['apache2'],
  }
  
  # Install apache2
  package { 'apache2':
    ensure => present,
  }

  # Copy config

    file { '/etc/apache2/conf-available/user.conf':
    source => 'puppet:///modules/apache2/vhost.wp.vagrant.conf'
  } -> file { '/etc/apache2/conf-enabled/user.conf':
    ensure  => link,
    target  => '/etc/apache2/conf-available/user.conf',
  }

  file { '/etc/apache2/sites-available/vhost.wp.vagrant.conf':
    source => 'puppet:///modules/apache2/vhost.wp.vagrant.conf'
  } -> file { '/etc/apache2/sites-enabled/vhost.wp.vagrant.conf':
    ensure  => link,
    target  => '/etc/apache2/sites-available/vhost.wp.vagrant.conf',
  }

  file { '/etc/apache2/mods-available/wp.vagrant.conf':
    source => 'puppet:///modules/apache2/wp.vagrant.conf'
  } -> file { '/etc/apache2/mods-enabled/wp.vagrant.conf':
    ensure  => link,
    target  => '/etc/apache2/mods-available/wp.vagrant.conf',
  }

  file { '/etc/apache2/mods-available/rewrite.load':
    source  => 'puppet:///modules/apache2/rewrite.load',
  } -> file { '/etc/apache2/mods-enabled/rewrite.load':
    ensure  => link,
    target  => '/etc/apache2/mods-available/rewrite.load',
  }

  # Start apache
  service { 'apache2':
    ensure  => running,
  }

  

}
