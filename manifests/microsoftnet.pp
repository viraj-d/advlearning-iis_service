# manifests/microsoftnet.pp

class iis_service::microsoftnet {

  # .Net 3.5
  dism { 'NetFx3ServerFeatures':
    ensure    => present,
    norestart => true,
    all       => true
  }

  dism{'NetFx3':
    ensure    => present,
    norestart => true,
    all       => true,
    require   => Dism['NetFx3ServerFeatures']
  }

  # .Net 4 and 4.5
  dism {'NetFx4ServerFeatures':
    ensure    => present,
    norestart => true
  }

  dism {'NetFx4':
    ensure    => present,
    norestart => true,
    require   => Dism['NetFx4ServerFeatures']
  }

  dism {'NetFx4Extended-ASPNET45':
    ensure    => present,
    norestart => true,
    require   => ['NetFx4']
  }
}
