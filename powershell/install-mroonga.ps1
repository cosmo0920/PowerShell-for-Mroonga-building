# @$mariadbVer MariaDBVer
# @$arch win32/winx64
# @$installSqlDir specify install.sql dir
. ".\versions.ps1"

cd $workDir

function mrnInstall($mariadbVer, $arch, $installSqlDir) {
  cd "mariadb-$mariadbVer-$arch"
  cmd /c "start .\bin\mysqld.exe"
  cmd /c ".\bin\mysql.exe -uroot <$installSqlDir\install.sql"
  cmd /c ".\bin\mysqladmin.exe -uroot shutdown"
  cd ..
}

$installSqlDir = "data"

#specify arch
$arch = "win32"

mrnInstall $mariadbVer $arch $installSqlDir

Start-Sleep -m 500

#specify arch
$arch = "winx64"

mrnInstall $mariadbVer $arch $installSqlDir

cd ..