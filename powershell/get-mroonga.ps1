$mariadbVer = "10.0.11"
$mroongaVer = "4.03"

Invoke-WebRequest -Uri http://packages.groonga.org/source/mroonga/mariadb-${mariadbVer}-with-mroonga-${mroongaVer}-for-windows.zip -OutFile source.zip
