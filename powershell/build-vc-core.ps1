. ".\versions.ps1"

if ($downloadRequestSkip -eq $TRUE) {
  Write-Host "Package downloading skipped."
} elseif ($useReleasePackage -eq $TRUE) {
  Write-Host "Use Mroonga $mroongaVer source"
  .\get-mroonga.ps1
  $zipname = "source.zip"
} else {
  $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes",""
  $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No",""
  $choices = [System.Management.Automation.Host.ChoiceDescription[]]($yes,$no)
  $caption = "== Mroonga source download =="
  $message = "Do you want to use nightly package?"
  try {
    $result = $Host.UI.PromptForChoice($caption,$message,$choices,0)
    # download Mroonga source
    if ($result -eq 0) {
      Write-Host "Use Mroonga $mroongaVer nightly source"
      .\get-mroonga-nightly.ps1
      $zipname = "source-nightly.zip"
      $useNightly = $TRUE
    }

    if ($result -eq 1) {
      Write-Host "Use Mroonga $mroongaVer source"
      .\get-mroonga.ps1
      $zipname = "source.zip"
    }
  } catch [NotImplementedException] {
    Write-Host "Use Mroonga $mroongaVer nightly source"
    .\get-mroonga-nightly.ps1
    $zipname = "source-nightly.zip"
  }
}

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
Write-Host "building Mroonga $mroongaVer with MariaDB $mariadbVer ..."
cd $workDir
cmd /c "build-$vcVer-zip-32.bat"
cmd /c "build-$vcVer-zip-64.bat"
<# msi build does not correctly work yet :(
cmd /c "build-$vcVer-msi-32.bat"
cmd /c "build-$vcVer-msi-64.bat"
#>
cd $originDir

# packaging Mroonga
Write-Host "unpack Mroonga $mroongaVer packed zip"
.\package-unzip.ps1
Write-Host "install Mroonga $mroongaVer to MariaDB"
.\install-mroonga.ps1
Write-Host "packing Mroonga $mroongaVer"
.\create-mrnzip.ps1