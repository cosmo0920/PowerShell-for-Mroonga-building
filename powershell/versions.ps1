$originDir = $(Get-Item ".").FullName
$workDir = "$originDir\work"
$mariadbVer = "10.1.28"
$mroongaVer = "7.07"
$useNightly = $null
#$useReleasePackage = $null
$downloadRequestSkip = $null
$mroongaSourceBaseURI = $null
$mroongaSourceNightlyBaseURI = $null
