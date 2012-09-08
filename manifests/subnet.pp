define dhcp::subnet (
  $mask,
  $gateway    = '',
  $options    = '',
  $parameters = '',
) {

  include dhcp::params
  $dhcp_dir = $dhcp::params::dhcp_dir

  concat { "${dhcp_dir}/dhcpd.subnet-${name}.conf": }
  concat::fragment { "dhcp_subnet_${name}_header":
    order   => '00',
    target  => "${dhcp_dir}/dhcpd.subnet-${name}.conf",
    content => "## subnet ${name} declarations\n",
  }

  concat::fragment { "dhcp_subnet_${name}":
    target  => "${dhcp_dir}/dhcpd.conf",
    content => template('dhcp/dhcpd.conf.subnet.erb'),
  }
}
