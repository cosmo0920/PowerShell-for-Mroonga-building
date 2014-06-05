. ".\versions.ps1"

$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes",""
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No",""
$choices = [System.Management.Automation.Host.ChoiceDescription[]]($yes,$no)
$caption = "== Mroonga source download =="
$message = "Do you want to use nightly package?"
$result = $Host.UI.PromptForChoice($caption,$message,$choices,0)
# download Mroonga source
if($result -eq 0) { 
  Write-Host "Use Mroonga $mroongaVer nightly source"
  .\get-mroonga-nightly.ps1
  $zipname = "source-nightly.zip"
}

if($result -eq 1) {
  Write-Host "Use Mroonga $mroongaVer source"
  .\get-mroonga.ps1
  $zipname = "source.zip"
}

# prepare building Mroonga
.\unzip.ps1
.\prepare-building-mroonga.ps1

# build MariaDB bundled Mroonga
cd $workDir
cmd /c "build-vc2010-zip-32.bat"
cmd /c "build-vc2010-zip-64.bat"
<# msi build does not correctly work yet :(
cmd /c "build-vc2010-msi-32.bat"
cmd /c "build-vc2010-msi-64.bat"
#>
cd $originDir

# packaging Mroonga
.\package-unzip.ps1
.\install-mroonga.ps1
.\create-mrnzip.ps1