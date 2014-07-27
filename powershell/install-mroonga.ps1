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

$installSqlDir = "share\mroonga"

$platform = "win32", "winx64"
foreach ($arch in $platform)
{
  mrnInstall $mariadbVer $arch $installSqlDir
  Start-Sleep -m 500
}

cd $originDir