# Check installed Mroonga for x86

function check_built_mroonga($arch) {
  $currentDir = pwd
  cd ..\work\mariadb-*-with-mroonga-*-$arch\bin
  cmd /c "start mysqld"
  cmd /c 'mysql -e "Show Engines;" -uroot'
  cmd /c "mysqladmin -uroot shutdown"
  cd $currentDir
}

check_built_mroonga win32
check_built_mroonga winx64