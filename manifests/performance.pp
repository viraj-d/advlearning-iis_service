# manifests/performance.pp

class iis_service::performance {
  dism {'IIS-Performance':
    ensure => present
  } ->
  dism {'IIS-HttpCompressionStatic':
    ensure => present
  }
}
