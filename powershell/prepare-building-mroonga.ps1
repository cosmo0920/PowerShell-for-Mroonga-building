# check install cmake
if ((Get-Command cmake) -eq $null) {
  Write-Host "Please install cmake 2.8.11.2."
  Exit
}

# check install bison
if ((Get-Command bison) -eq $null) {
  Write-Host "Please install bison."
  Exit
}

$workDir = "work"
$sourceDir = "source"
if (Test-Path -path $workDir) {
  # Mroonga packages contains too loooooong name files. Use rmdir instead.
  cmd /c "rmdir /Q /S .\work"
}
New-Item $workDir -itemType directory
Move-Item mariadb-*-for-windows* $workDir/$sourceDir
Copy-Item batfiles\build-*.bat $workDir
