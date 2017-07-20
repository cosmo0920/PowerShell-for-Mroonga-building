. ".\versions.ps1"

if ($mroongaSourceBaseURI -eq $null) {
  $mroongaSourceBaseURI = "http://packages.groonga.org/source/mroonga/"
} else {
  Write-Host "Use ${mroongaSourceBaseURI} as base URI."
}

try {
  Invoke-WebRequest -Uri ${mroongaSourceBaseURI}/mariadb-${mariadbVer}-with-mroonga-${mroongaVer}-for-windows.zip -OutFile source.zip
} catch [System.Net.WebException] {
  Write-Host "Not Found package."
  Exit 1
}
