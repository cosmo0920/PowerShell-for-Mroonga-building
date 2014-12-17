. ".\versions.ps1"

[Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")

function New-ZipItem([string]$destFile, [string]$srcDir)
{
  $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
  $includeBaseDir = $false
  [System.IO.Compression.ZipFile]::CreateFromDirectory($srcDir, $destFile, $compressionLevel, $includeBaseDir)
}

$platform = "win32", "winx64"
cd $workDir

foreach ($arch in $platform)
{
  $destFile = "$workDir\mariadb-$mariadbVer-with-mroonga-$mroongaVer-$arch.zip"
  $srcDir = "$workDir\mariadb-$mariadbVer-$arch"

  if (Test-Path $destFile)
  {
    Remove-Item $destFile
  }

  New-ZipItem "$destFile" "$srcDir"
}

cd $originDir