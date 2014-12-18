. ".\versions.ps1"

Invoke-WebRequest -Uri http://packages.groonga.org/source/mroonga/mariadb-${mariadbVer}-with-mroonga-${mroongaVer}-for-windows.zip -OutFile source.zip -ErrorAction Stop