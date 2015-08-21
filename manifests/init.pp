# manifests/init.pp

class iis_service() {

  # Defaults
  File { source_permissions => ignore }

  # Requires Microsoft.Net to be installed
  include iis_service::microsoftnet

  # Windows Activation Service
  dism {'WAS-WindowsActivationService':
    ensure => present
  }

  # Has role and basic web server top level
  dism {'IIS-WebServerRole':
    ensure  => present,
    require => Dism['WAS-WindowsActivationService']
  }
  dism {'IIS-WebServer':
    ensure  => present,
    require => Dism['IIS-WebServerRole']
  }

  # Sub sections of IIS config
  include iis_service::common
  include iis_service::health
  include iis_service::performance
  include iis_service::security
  include iis_service::appdev
  include iis_service::management

  # ensure that web server is installed before we try and activate included modules
  Dism['IIS-WebServer'] -> Class['iis_service::common']
  Dism['IIS-WebServer'] -> Class['iis_service::health']
  Dism['IIS-WebServer'] -> Class['iis_service::performance']
  Dism['IIS-WebServer'] -> Class['iis_service::security']
  Dism['IIS-WebServer'] -> Class['iis_service::appdev']
  Dism['IIS-WebServer'] -> Class['iis_service::management']

  # Disable FTP
  dism {'IIS-FTPServer':
    ensure  => absent,
    require => Dism['IIS-WebServer']
  }

  # WCF
  #include progresso::iis::wcf
  inclued iis_service::wcf
  Dism['WAS-WindowsActivationService'] -> Class['iis_service::wcf']

}
