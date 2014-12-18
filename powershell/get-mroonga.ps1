. ".\versions.ps1"

try {
  Invoke-WebRequest -Uri http://packages.groonga.org/source/mroonga/mariadb-${mariadbVer}-with-mroonga-${mroongaVer}-for-windows.zip -OutFile source.zip
} catch [System.Net.WebException] {
  Write-Host "Not Found package."
  Exit 1
}
