# $file: need specify full path
$workDir = "C:\Code\work"
$mariadbVer = "10.0.10"

function unzipMrnPackage($workDir, $mariaDBVer, $arch) {
  $file = "$workDir\mariadb-$mariadbVer-$arch.zip"
  $shell = New-Object -ComObject shell.application
  $zip = $shell.NameSpace($file)
  $dest =  $shell.NameSpace((Split-Path $file -Parent))

  $dest.CopyHere($zip.Items())
}

$arch = "win32"

unzipMrnPackage $workDir $mariaDBVer $arch

<#
$arch = "winx64"

unzipMrnPackage $workDir $mariaDBVer $arch
#>