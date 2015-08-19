# manifests/microsoftnet.pp

class iis::microsoftnet {

  # .Net 3.5
  dism { 'NetFx3ServerFeatures':
    norestart => true,
    all       => true
  }

  dism{'NetFx3':
    norestart => true,
    all       => true,
    require   => Dism['NetFx3ServerFeatures']
  }

  # .Net 4 and 4.5
  dism {'NetFx4ServerFeatures':
    norestart => true
  }

  dism {'NetFx4':
    norestart => true,
    require   => Dism['NetFx4ServerFeatures']
  }

  dism {'NetFx4Extended-ASPNET45':
    norestart => true,
    require   => ['NetFx4']
  }
}
