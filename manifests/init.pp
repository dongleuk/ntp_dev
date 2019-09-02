#Manage NTP
class ntp_dev {
  ensure_packages(['ntp'])

  file { '/etc/ntp.conf':
    source => 'puppet:///modules/ntp_dev/ntp.conf',
    notify => Service['ntp'],
    require => Package['ntp'],
  }

  service { 'ntp':
    ensure => running,
    enable => true,
  }
}
