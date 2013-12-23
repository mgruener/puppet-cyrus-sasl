class cyrus_sasl (
  $packages_base = 'cyrus-sasl',
  $packages_gs2 = 'cyrus-sasl-gs2',
  $packages_gssapi = 'cyrus-sasl-gssapi',
  $packages_ldap  = 'cyrus-sasl-ldap',
  $packages_md5 = 'cyrus-sasl-md5',
  $packages_ntlm = 'cyrus-sasl-ntlm',
  $packages_plain = 'cyrus-sasl-plain',
  $packages_scram = 'cyrus-sasl-scram',
  $packages_sql = 'cyrus-sasl-sql',
  $features = [ 'base' ]
) {
  if 'base' in $features {
    package { $packages_base:
      ensure => present
    }
  }
  if 'gs2' in $features {
    package { $packages_gs2:
      ensure => present
    }
  }
  if 'gssapi' in $features {
    package { $packages_gssapi:
      ensure => present
    }
  }
  if 'ldap' in $features {
    package { $packages_ldap:
      ensure => present
    }
  }
  if 'md5' in $features {
    package { $packages_md5:
      ensure => present
    }
  }
  if 'ntlm' in $features {
    package { $packages_ntlm:
      ensure => present
    }
  }
  if 'plain' in $features {
    package { $packages_plain:
      ensure => present
    }
  }
  if 'scram' in $features {
    package { $packages_scram:
      ensure => present
    }
  }
  if 'sql' in $features {
    package { $packages_sql:
      ensure => present
    }
  }
}
