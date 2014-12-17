. ".\versions.ps1"
# check install patch
if ((Get-Command patch) -eq $null) {
  Write-Host "Please install MinGW patch."
  Exit
}

if ($applyPatch -eq $null) {
  Write-Host "Nothing to do!"
} else {
  cd "$workDir\source"
  $patches = $(Get-ChildItem "$originDir\..\patches").FullName
  foreach ($item in $patches)
  {
    Write-Host "using $item file"
    cmd /c "patch -p0 < $item"
  }
cd $originDir
}