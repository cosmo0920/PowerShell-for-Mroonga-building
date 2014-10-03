. ".\versions.ps1"
# check install patch
if ((Get-Command patch) -eq $null) {
  echo "Please install MinGW patch."
  Exit
}

if ($applyPatch -eq $null) {
  echo "Nothing to do!"	
} else {
  cd "$workDir\source"
  $patches = $(Get-ChildItem "$originDir\..\patches").FullName
  foreach ($item in $patches)
  {
    echo "using $item file"
    cmd /c "patch -p0 < $item"
  }
cd $originDir
}