define dhcp::class (
	$match      = '',
	$subclasses = [],
	$spawn      = '',
	$limit      = '',
) {

	include dhcp::params
	$dhcp_dir = $dhcp::params::dhcp_dir

	concat::fragment { "dhcp_class_${name}":
		target  => "${dhcp_dir}/dhcpd.conf",
		content => template('dhcp/dhcpd.conf.class.erb'),
	}
}
