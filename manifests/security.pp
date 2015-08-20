# manifests/security.pp

class iis_service::security {
  dism {'IIS-Security':
    ensure => present
  } ->
  dism {'IIS-RequestFiltering':
    ensure => present
  } ->
  dism {'IIS-ClientCertificateMappingAuthentication':
    ensure => absent
  } ->
  dism {'IIS-CertProvider':
    ensure => present
  }
}
