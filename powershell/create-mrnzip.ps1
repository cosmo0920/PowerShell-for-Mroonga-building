Param(
  [Parameter(mandatory=$false)][String]$mariadbVersion = $null,
  [Parameter(mandatory=$false)][String]$mroongaVersion = $null,
  [Parameter(mandatory=$false)][String]$platform = $null
)

[Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")

. ".\versions.ps1"

if (!$mariadbVersion) {
  $mariadbVersion = $mariadbVer
}
if (!$mroongaVersion) {
  $mroongaVersion = $mroongaVer
}
if ($platform) {
  $platforms = $platform -split ","
} else {
  $platforms = "win32", "winx64"
}

function New-ZipItem([string]$destFile, [string]$srcDir)
{
  $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
  $includeBaseDir = $false
  [System.IO.Compression.ZipFile]::CreateFromDirectory($srcDir, $destFile, $compressionLevel, $includeBaseDir)
}

cd $workDir

foreach ($arch in $platforms)
{
  $destFile = "$workDir\mariadb-$mariadbVersion-with-mroonga-$mroongaVersion-$arch.zip"
  $srcDir = "$workDir\mariadb-$mariadbVersion-$arch"

  if (Test-Path $destFile)
  {
    Remove-Item $destFile
  }

  New-ZipItem "$destFile" "$srcDir"
}

cd $originDir
