. ".\versions.ps1"

# always use nightly package
$useNightly = $TRUE
# download Mroonga nightly source
Write-Host "Use Mroonga $mroongaVer nightly source"
.\get-mroonga-nightly.ps1
$zipname = "source-nightly.zip"

# prepare building Mroonga
Write-Host "extract Mroonga $mroongaVer zip"
.\unzip.ps1
Write-Host "get Mroonga batfile for windows"
.\get-mroonga-batfiles.ps1
Write-Host "prepare Mroonga $mroongaVer building"
.\prepare-building-mroonga.ps1
Write-Host "apply patch file(s)"
.\apply-patch.ps1

# build MariaDB bundled Mroonga
if ($vcVer -eq $null) {
  exit 2
}
Write-Host "building Mroonga $mroongaVer with MariaDB $mariadbVer ..."
cd $workDir
cmd /c "build-$vcVer-zip-32.bat"
cmd /c "build-$vcVer-zip-64.bat"
cd $originDir

# packaging Mroonga
Write-Host "unpack Mroonga $mroongaVer packed zip"
.\package-unzip.ps1
Write-Host "install Mroonga $mroongaVer to MariaDB"
.\install-mroonga.ps1
Write-Host "packing Mroonga $mroongaVer"
.\create-mrnzip.ps1