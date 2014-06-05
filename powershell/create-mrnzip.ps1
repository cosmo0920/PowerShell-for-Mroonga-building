. ".\versions.ps1"

[Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")

function zip([string]$destFile, [string]$srcDir)
{
    $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
    $includeBaseDir = $false
    [System.IO.Compression.ZipFile]::CreateFromDirectory($srcDir, $destFile, $compressionLevel, $includeBaseDir)
}

$arch = "win32"
$destFile = "$workDir\mariadb-$mariadbVer-with-mroonga-$mroongaVer-$arch.zip"
$srcDir = "$workDir\mariadb-$mariadbVer-$arch"

cd $workDir

## create win32 package
if (Test-Path $destFile)
{
    rm $destFile
}

zip "$destFile" "$srcDir"

## create winx64 package
$arch = "winx64"
$destFile = "$workDir\mariadb-$mariadbVer-with-mroonga-$mroongaVer-$arch.zip"
$srcDir = "$workDir\mariadb-$mariadbVer-$arch"

if (Test-Path $destFile)
{
    rm $destFile
}

zip "$destFile" "$srcDir"

cd $originDir