# -*- mode: ruby -*-
# vi: set ft=ruby :

class jenkins::install {

  package { ["libqt4-dev", "libjpeg-dev", "libpng-dev", "imagemagick"]:
    ensure  => installed,
    require  => Class['common::basic']
  }

  # Create dir to store keys
  file { "/var/opt/keys_jenkins":
    ensure   => "directory",
    owner    =>  root,
    group    =>  root,
    require  =>  Class["common::basic"]
  }

  #Config key
  file { "/var/opt/keys_jenkins/jenkins-ci.org.key":
    owner    =>  root,
    group    =>  root,
    content  =>  template("jenkins/jenkins-ci.org.key"),
    require  =>  File["/var/opt/keys_jenkins"]
  }

  exec {"get-jenkins-key":
    command => "/usr/bin/apt-key add /var/opt/keys_jenkins/jenkins-ci.org.key",
    require => File["/var/opt/keys_jenkins/jenkins-ci.org.key"]
  }

  #Config jenkins repo
  file { "/etc/apt/sources.list.d/jenkins.list":
    owner    =>  root,
    group    =>  root,
    mode     =>  644,
    content  =>  template("jenkins/jenkins.list"),
    require  =>  Exec['get-jenkins-key']
  }

  exec { "apt-update-jenkins":
    command => "/usr/bin/apt-get update -y -q",
    timeout => 0,
    require => File["/etc/apt/sources.list.d/jenkins.list"]
  }

  package { "jenkins":
    ensure  => installed,
    require => Exec["apt-update-jenkins"]
 }

  exec {'add_group_admin_in_user_jenkins':
    unless   => 'grep -Ec admin.*:jenkins /etc/group',
    command  => 'usermod -aG admin jenkins',
    path     => ['/bin', '/usr/sbin'],
    require  => Package['jenkins']
  }

}
