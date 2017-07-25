. ".\versions.ps1"

$batfileDir = "batfiles"
if (!(Test-Path -path $batfileDir)) {
  New-Item $batfileDir -itemType directory
}
$batfiles = "build-vc2015.bat",
"build-vc2015-zip-32.bat",
"build-vc2015-zip-64.bat",
"build-vc2015-msi-32.bat",
"build-vc2015-msi-64.bat",
"build-vc2017.bat",
"build-vc2017-zip-32.bat",
"build-vc2017-zip-64.bat",
"build-vc2017-msi-32.bat",
"build-vc2017-msi-64.bat"

foreach ($file in $batfiles)
{
  if (!(Test-Path -path $batfileDir/$file)) {
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/mroonga/mroonga/master/packages/windows/${file} -Outfile ${batfileDir}/${file}
  }
}
