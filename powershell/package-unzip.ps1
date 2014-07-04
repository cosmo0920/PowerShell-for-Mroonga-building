# $file: need specify full path
. ".\versions.ps1"

function unzipMrnPackage($workDir, $mariaDBVer, $arch) {
  $file = "$workDir\mariadb-$mariadbVer-$arch.zip"
  #Load the assembly
  [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
  [System.IO.Compression.ZipFile]::ExtractToDirectory($file, $pwd)
}

cd $workDir

$arch = "win32"

unzipMrnPackage $workDir $mariaDBVer $arch

$arch = "winx64"

unzipMrnPackage $workDir $mariaDBVer $arch

cd $originDir