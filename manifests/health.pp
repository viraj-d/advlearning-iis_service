# manifests/health.pp

class iis_service::health {
  dism {'IIS-HealthAndDiagnostics':
    ensure => present
  }
  dism {'IIS-HttpLogging':
    ensure  => absent,
    require => Dism['IIS-HealthAndDiagnostics']
  }
  dism {'IIS-RequestMonitor':
    ensure  => present,
    require => Dism['IIS-HealthAndDiagnostics']
  }
}
