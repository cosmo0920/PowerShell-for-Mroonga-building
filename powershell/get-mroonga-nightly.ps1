. ".\versions.ps1"

$nightlyVer = "2014.06.03"

Invoke-WebRequest -Uri http://packages.groonga.org/nightly/mariadb-${mariadbVer}-with-mroonga-${mroongaVer}-for-windows.${nightlyVer}.zip -OutFile source-nightly.zip