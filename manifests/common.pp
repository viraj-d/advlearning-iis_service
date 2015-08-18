# manifests/common.pp

class iis::common {
  dism {'IIS-CommonHttpFeatures':
    ensure => present
  }
  dism {'IIS-StaticContent':
    ensure  => present,
    require => Dism['IIS-CommonHttpFeatures']
  }
  dism {'IIS-DefaultDocument':
    ensure  => present,
    require => Dism['IIS-CommonHttpFeatures']
  }
  dism {'IIS-DirectoryBrowsing':
    ensure  => absent,
    require => Dism['IIS-CommonHttpFeatures']
  }
  dism {'IIS-HttpErrors':
    ensure  => present,
    require => Dism['IIS-CommonHttpFeatures']
  }
  dism {'IIS-HttpRedirect':
    ensure  => present,
    require => Dism['IIS-CommonHttpFeatures']
  }
}
