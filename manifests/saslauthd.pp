class cyrus_sasl::saslauthd (
  $ensure = running,
  $enable = true,
  $socketdir = undef,
  $mech = undef,
  $flags = undef,
) {
  include cyrus_sasl

  $serviceprovider = $::operatingsystem ? {
    'Fedora' => 'systemd',
    'Ubuntu' => 'upstart',
    default  => undef
  }

  if $socketdir {
    augeas { 'saslauthd-socketdir':
      context => '/files/etc/sysconfig/saslauthd',
      incl    => '/etc/sysconfig/saslauthd',
      lens    => 'Shellvars.lns',
      changes => "set SOCKETDIR '${socketdir}'",
      notify  => Service['saslauthd']
    }
  }

  if $mech {
    augeas { 'saslauthd-mech':
      context => '/files/etc/sysconfig/saslauthd',
      incl    => '/etc/sysconfig/saslauthd',
      lens    => 'Shellvars.lns',
      changes => "set MECH '${mech}'",
      notify  => Service['saslauthd']
    }
  }

  if $flags {
    augeas { 'saslauthd-flags':
      context => '/files/etc/sysconfig/saslauthd',
      incl    => '/etc/sysconfig/saslauthd',
      lens    => 'Shellvars.lns',
      changes => "set FLAGS '${flags}'",
      notify  => Service['saslauthd']
    }
  }
  
  service { 'saslauthd':
    ensure   => $ensure,
    enable   => $enable,
    provider => $serviceprovider
  }
}
