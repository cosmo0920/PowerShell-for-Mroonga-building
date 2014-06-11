$stable = "source.zip"
$nightly = "source-nightly.zip"
if (Test-Path -path "$stable") {
  $zipname = "$stable"
}
if (Test-Path -path "$nightly") {
  $zipname = "$nightly"
}

$file = $(Get-ChildItem $zipname).FullName
$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace($file)
$dest =  $shell.NameSpace((Split-Path $file -Parent))

$dest.CopyHere($zip.Items())