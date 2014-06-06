# check install cmake
if ((Get-Command cmake) -eq $null) {
  echo "Please install cmake 2.8.11.2."
  Exit
}

# check install bison
if ((Get-Command bison) -eq $null) {
  echo "Please install bison."
  Exit
}

$workDir = "work"
$sourceDir = "source"
if (Test-Path -path $workDir) {
  Remove-Item $workDir -Recurse -Force
}
New-Item $workDir -itemType directory
Move-Item mariadb-*-for-windows* $workDir/$sourceDir
Copy-Item batfiles\build-*.bat $workDir