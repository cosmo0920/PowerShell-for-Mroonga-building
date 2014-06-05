$workDir = "work"
$sourceDir = "source"
if (Test-Path -path $workDir) {
  Remove-Item $workDir -Recurse -Force
}
New-Item $workDir -itemType directory
Move-Item mariadb-*-for-windows* $workDir/$sourceDir
Copy-Item batfiles\build-*.bat $workDir