$wixArchiveName = "wix39-binaries.zip"
Invoke-WebRequest -Uri http://wixtoolset.org/downloads/v3.9.818.0/${wixArchiveName} -OutFile ${wixArchiveName}

$pathToZip = "$pwd\${wixArchiveName}"
#Load the assembly
[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
[System.IO.Compression.ZipFile]::ExtractToDirectory($pathToZip, "$pwd\${wixArchiveName}")

# set Path
$Env:Path = "$pwd\${wixArchiveName};" + $Env:Path