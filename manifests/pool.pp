define dhcp::pool (
  $range,
  $gateway,
  $subnet,
  $failover    = '',
  $options     = '',
  $parameters  = ''
) {

  include dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  concat::fragment { "dhcp_pool_${name}":
    order   => '50',
    target  => "${dhcp_dir}/dhcpd.subnet-${subnet}.conf",
    content => template('dhcp/dhcpd.pool.erb'),
  }

}

