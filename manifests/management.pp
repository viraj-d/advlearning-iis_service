# manifests/management.pp

class iis::management {
  # IIS Management console
  dism {'IIS-ManagementConsole':
    ensure => present
  } ->
  dism {'IIS-ManagementScriptingTools':
    ensure => present
  } ->
  dism {'IIS-IIS6ManagementCompatibility':
    ensure => present
  } ->
  dism {'IIS-Metabase':
    ensure => present
  } ->
  dism {'IIS-LegacySnapIn':
    ensure => present
  }
}
