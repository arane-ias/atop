# Class: atop
#
#
class atop (
  $package_name = $atop::params::package_name,
  $service_name = $atop::params::service_name,
  $service = $atop::params::service,
  $interval = $atop::params::interval,
  $logpath = $atop::params::logpath,
  $conf_file = $atop::params::conf_file,
  $rotate_count = $atop::params::rotate_count,
  $rotate_days = $atop::params::rotate_days,
) inherits atop::params {
  package { $package_name:
    ensure   => 'installed',
  } file { $atop::params::conf_file:
    ensure  => file,
    owner   => $atop::params::conf_file_owner,
    group   => $atop::params::conf_file_group,
    mode    => $atop::params::conf_file_mode,
    content => epp('atop/atop.epp'),
    notify  => Service[$service_name],
  } ~> service { $service_name:
    ensure => running,
    enable => true,
  }
  file { '/etc/logrotate.d/atop':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('atop/atop.logrotate.epp'),
  }
  file { '/usr/lib/systemd/system/atop.service':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/atop/atop.service',
  }
}
