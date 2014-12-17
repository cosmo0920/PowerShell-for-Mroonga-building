# @$mariadbVer MariaDBVer
# @$arch win32/winx64
# @$installSqlDir specify install.sql dir
. ".\versions.ps1"

cd $workDir

function Wait-UntilRunning($cmdName) {
  do
  {
    $Running = Get-Process $cmdName -ErrorAction SilentlyContinue
    Start-Sleep -m 500
  } while (!$Running)
}

function Wait-UntilTerminate($cmdName) {
  do
  {
    $Running = Get-Process $cmdName -ErrorAction SilentlyContinue
    Start-Sleep -m 500
  } while ($Running)
}

function Install-Mroonga($mariadbVer, $arch, $installSqlDir) {
  cd "mariadb-$mariadbVer-$arch"
  cmd /c "start .\bin\mysqld.exe"
  Wait-UntilRunning mysqld
  cmd /c ".\bin\mysql.exe -uroot <$installSqlDir\install.sql"
  cmd /c ".\bin\mysqladmin.exe -uroot shutdown"
  Wait-UntilTerminate mysqld
  cd ..
}

$installSqlDir = "share\mroonga"

$platform = "win32", "winx64"
foreach ($arch in $platform)
{
  Install-Mroonga $mariadbVer $arch $installSqlDir
  Start-Sleep -m 500
}

cd $originDir