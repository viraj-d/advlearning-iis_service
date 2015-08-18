# manifests/performance.pp

class iis::performance {
  dism {'IIS-Performance':
    ensure => present
  } ->
  dism {'IIS-HttpCompressionStatic':
    ensure => present
  }
}
