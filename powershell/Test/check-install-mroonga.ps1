# Check installed Mroonga for (x86|x64)

function check_built_mroonga($arch) {
  $currentDir = pwd
  cd ..\work\mariadb-*-with-mroonga-*-$arch\bin
  cmd /c "start mysqld"
  cmd /c 'mysql -e "Show Engines;" -uroot'
  cmd /c "mysqladmin -uroot shutdown"
  cd $currentDir
}

$arch = "win32", "winx64"

foreach ($platform in $arch) {
  check_built_mroonga $platform
}