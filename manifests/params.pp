# Class: atop::params

#
class atop::params {
  $package_name = 'atop'
  $service_name = 'atop'
  $service = true
  $interval = 300
  $logpath = '/var/log/atop'
  $conf_file = '/etc/sysconfig/atop'
  $conf_file_owner = 'root'
  $conf_file_group = 'root'
  $conf_file_mode = '644'
  $rotate_count = '1'
  $rotate_days = '+6'
}
