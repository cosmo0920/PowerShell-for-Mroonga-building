$workDir = "C:\Code\work"
$maridbVer = "10.0.10"
$mroongaVer = "4.02"

$arch = "win32"
$destFile = "$workDir\mariadb-$maridbVer-$arch-with-mroonga-$mroongaVer.zip"
$srcDir = "$workDir\mariadb-$mariadbVer-$arch"

[Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")

function zip([string]$destFile, [string]$srcDir)
{
    $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
    $includeBaseDir = $false
    [System.IO.Compression.ZipFile]::CreateFromDirectory($srcDir, $destFile, $compressionLevel, $includeBaseDir)
}

## create win32 package
if (Test-Path $destFile)
{
    rm $destFile
}

zip "$destFile" "$srcDir"

<# 
## create winx64 package
$arch = "winx64"
$destFile = "$workDir\mariadb-$maridbVer-$arch-with-mroonga-$mroongaVer.zip"
$srcDir = "$workDir\mariadb-$mariadbVer-$arch"

if (Test-Path $destFile)
{
    rm $destFile
}

zip "$destFile" "$srcDir"
#>