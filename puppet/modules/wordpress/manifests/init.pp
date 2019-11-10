# Install latest Wordpress

class wordpress::install {

  package { "curl":
    ensure => installed,
  }

  # Create the Wordpress database
  exec { 'create-database':
    unless  => 'sudo /usr/bin/mysql -uroot wordpress',
    command => 'sudo /usr/bin/mysql -uroot --execute=\'create database `wordpress`\'',
    user => 'root'
  }

  exec { 'create-user':
    unless  => 'sudo /usr/bin/mysql -u wordpress -pwordpress `wordpress`',
    command => 'sudo /usr/bin/mysql -uroot --execute="GRANT ALL PRIVILEGES ON wordpress.* TO \'wordpress\'@\'localhost\' IDENTIFIED BY \'wordpress\'"',
    user => 'root'
  }

  exec { 'download-wordpress':
    command => '/usr/bin/wget http://wordpress.org/latest.tar.gz',
    cwd     => '/vagrant/wp.test',
    creates => '/vagrant/wp.test/latest.tar.gz'
  }

  exec { 'untar-wordpress':
    cwd     => '/vagrant/wp.test',
    command => '/bin/tar xzvf /vagrant/wp.test/latest.tar.gz',
    require => Exec['download-wordpress'],
  }

  exec { 'mv-wordpress':
    cwd     => '/vagrant/wp.test',
    command => 'mv wordpress/* wp/',
    require => Exec['untar-wordpress'],
  }

  exec { 'rm-wordpress':
    cwd     => '/vagrant/wp.test',
    command => 'rm -rf wordpress; rm latest.tar.gz',
    require => Exec['mv-wordpress'],
  }
  
  # Copy wp-config.php file for the vagrant setup
  file { '/vagrant/wp.test/wp/wp-config.php':
    source => 'puppet:///modules/wordpress/wp-config.php'
  }

}
