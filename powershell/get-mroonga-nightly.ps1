. ".\versions.ps1"

if ($nightlyVer -eq $null) {
  $today = Get-Date -Format "yyyy.MM.dd"
  $nightlyVer = "$today"
}

if ($mroongaSourceNightlyBaseURI -eq $null) {
  $mroongaSourceNightlyBaseURI = "http://packages.groonga.org/nightly/"
} else {
  Write-Host "Use ${mroongaSourceNightlyBaseURI} as base nightly URI."
}

try {
  Invoke-WebRequest -Uri ${$mroongaSourceNightlyBaseURI}/mariadb-${mariadbVer}-with-mroonga-${mroongaVer}-for-windows.${nightlyVer}.zip -OutFile source-nightly.zip
} catch [System.Net.WebException] {
  Write-Host "Not Found nightly package."
  Exit 1
}
