rem Check installed Mroonga for x86
cd ..\powershell\work\mariadb-*-with-mroonga-*-win32\bin
start mysqld
mysql -e "Show Engines;" -uroot
mysqladmin -uroot shutdown
cd ..\..\..\..\batfile

rem Check installed Mroonga for x86_64
cd ..\powershell\work\mariadb-*-with-mroonga-*-winx64\bin
start mysqld
mysql -e "Show Engines;" -uroot
mysqladmin -uroot shutdown
cd ..\..\..\..\batfile