# manifests/init.pp

class iis() {

  # Defaults
  File { source_permissions => ignore }

  # Requires Microsoft.Net to be installed
  include iis::microsoftnet

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
  include iis::common
  include iis::health
  include iis::performance
  include iis::security
  include iis::appdev
  include iis::management

  # ensure that web server is installed before we try and activate included modules
  Dism['IIS-WebServer'] -> Class['iis::common']
  Dism['IIS-WebServer'] -> Class['iis::health']
  Dism['IIS-WebServer'] -> Class['iis::performance']
  Dism['IIS-WebServer'] -> Class['iis::security']
  Dism['IIS-WebServer'] -> Class['iis::appdev']
  Dism['IIS-WebServer'] -> Class['iis::management']

  # Disable FTP
  dism {'IIS-FTPServer':
    ensure  => absent,
    require => Dism['IIS-WebServer']
  }

  # WCF
  include progresso::iis::wcf
  Dism['WAS-WindowsActivationService'] -> Class['iis::wcf']

}
