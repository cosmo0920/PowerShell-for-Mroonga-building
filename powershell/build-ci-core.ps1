. ".\versions.ps1"

# download Mroonga nightly source
Write-Host "Use Mroonga $mroongaVer nightly source"
.\get-mroonga-nightly.ps1
$zipname = "source-nightly.zip"

# prepare building Mroonga
echo "extract Mroonga $mroongaVer zip"
.\unzip.ps1
echo "get Mroonga batfile for windows"
.\get-mroonga-batfiles.ps1
echo "prepare Mroonga $mroongaVer building"
.\prepare-building-mroonga.ps1
echo "apply patch file(s)"
.\apply-patch.ps1

# build MariaDB bundled Mroonga
if ($vcVer -eq $null) {
  exit 2
}
echo "building Mroonga $mroongaVer with MariaDB $mariadbVer ..."
cd $workDir
cmd /c "build-$vcVer-zip-32.bat"
cmd /c "build-$vcVer-zip-64.bat"
cd $originDir

# packaging Mroonga
echo "unpack Mroonga $mroongaVer packed zip"
.\package-unzip.ps1
echo "install Mroonga $mroongaVer to MariaDB"
.\install-mroonga.ps1
echo "packing Mroonga $mroongaVer"
.\create-mrnzip.ps1