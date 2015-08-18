# manifests/appdev.pp

class iis::appdev {
  dism {'IIS-ApplicationDevelopment':
    ensure => present
  }
  dism {'IIS-ApplicationInit':
    ensure  => present,
    require => Dism['IIS-ApplicationDevelopment']
  }
  dism {'IIS-ISAPIFilter':
    ensure  => present,
    require => Dism['IIS-ApplicationDevelopment']
  }
  dism {'IIS-ISAPIExtensions':
    ensure  => present,
    require => Dism['IIS-ApplicationDevelopment']
  } ->
  dism {'IIS-NetFxExtensibility':
    ensure  => present,
    require => Dism['IIS-ApplicationDevelopment']
  }
  dism {'IIS-NetFxExtensibility45':
    ensure  => present,
    require => Dism['IIS-ApplicationDevelopment']
  }
  dism {'IIS-ASPNET':
    ensure  => present,
    require => Dism['IIS-NetFxExtensibility']
  }
  dism {'IIS-ASPNET45':
    ensure  => present,
    require => Dism['IIS-NetFxExtensibility45']
  }
}
