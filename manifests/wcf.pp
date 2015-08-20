# manifests/wcf.pp

class iis_service::wcf {
  # WCF HTTP Activation (required by API sites)
  dism {'WAS-ProcessModel':
    ensure  => present
  } ->
  dism {'WAS-NetFxEnvironment':
    ensure => present
  } ->
  dism {'WAS-ConfigurationAPI':
    ensure => present
  } ->
  dism {'WCF-HTTP-Activation':
    ensure => present
  } ->
  dism {'WCF-HTTP-Activation45':
    ensure => present
  }
}
