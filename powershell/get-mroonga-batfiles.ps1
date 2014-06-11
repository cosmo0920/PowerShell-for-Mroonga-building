. ".\versions.ps1"

$batfileDir = "batfiles"
if (!(Test-Path -path $batfileDir)) {
  New-Item $batfileDir -itemType directory
}
$batfiles = "build-vc2010.bat",
"build-vc2010-zip-32.bat",
"build-vc2010-zip-64.bat",
"build-vc2010-msi-32.bat",
"build-vc2010-msi-64.bat",
"build-vc2013.bat",
"build-vc2013-zip-32.bat",
"build-vc2013-zip-64.bat",
"build-vc2013-msi-32.bat",
"build-vc2013-msi-64.bat"

foreach ($file in $batfiles)
{
  if (!(Test-Path -path $batfileDir/$file)) {
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/mroonga/mroonga/master/packages/windows/${file} -Outfile ${batfileDir}/${file}
  }
}