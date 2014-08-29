$wixArchiveName = "wix39-binaries.zip"
$wixInstallDir = "wix39-binaries"

Invoke-WebRequest -Uri http://wixtoolset.org/downloads/v3.9.818.0/${wixArchiveName} -OutFile ${wixArchiveName}

$pathToZip = "$pwd\${wixArchiveName}"
New-Item ${wixInstallDir} -type Directory
#Load the assembly
[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
[System.IO.Compression.ZipFile]::ExtractToDirectory($pathToZip, "$pwd\${wixInstallDir}")

# set Path
$Env:Path = "$pwd\${wixInstallDir};" + $Env:Path