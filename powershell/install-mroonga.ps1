# @$mariadbVer MariaDBVer
# @$arch win32/winx64
# @$installSqlDir specify install.sql dir

Param(
  [Parameter(mandatory=$false)][String]$mariadbVersion = $null,
  [Parameter(mandatory=$false)][String]$mroongaVersion = $null,
  [Parameter(mandatory=$false)][String[]]$platforms = $null
)

. ".\versions.ps1"

if (!$mariadbVersion) {
  $mariadbVersion = $mariadbVer
}
if (!$mroongaVersion) {
  $mroongaVersion = $mroongaVer
}
if (!$platforms) {
  $platforms = "win32", "winx64"
}

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
  Start-Process .\bin\mysqld.exe
  Wait-UntilRunning mysqld
  Get-Content "$installSqlDir\install.sql" | .\bin\mysql.exe -uroot
  Start-Sleep -m 1000
  Start-Process .\bin\mysqladmin.exe -ArgumentList "-uroot shutdown"
  Wait-UntilTerminate mysqld
  cd ..
}

$installSqlDir = ".\share\mroonga"

foreach ($arch in $platforms)
{
  Install-Mroonga $mariadbVersion $arch $installSqlDir
  Start-Sleep -m 500
}

cd $originDir
