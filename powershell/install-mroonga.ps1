# @$mariadbVer MariaDBVer
# @$arch win32/winx64
# @$installSqlDir specify install.sql dir

function mrnInstall($mariadbVer, $arch, $installSqlDir) {
  cd "mariadb-$mariadbVer-$arch"
  cmd /c "start .\bin\mysqld.exe"
  cmd /c ".\bin\mysql.exe -uroot <$installSqlDir\install.sql"
  cmd /c ".\bin\mysqladmin.exe -uroot shutdown"
  cd ..
}

$mariadbVer = "10.0.10"
$arch = "win32"
$installSqlDir = "data"

mrnInstall $mariadbVer $arch $installSqlDir

<#
$mariadbVer = "10.0.10"
$arch = "winx64"
$installSqlDir = "data"

mrnInstall $mariadbVer $arch $installSqlDir
#>