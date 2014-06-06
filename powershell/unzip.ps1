if ($file -eq $null) {
  $zipname = "source.zip"
}

$file = $(Get-ChildItem $zipname).FullName
$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace($file)
$dest =  $shell.NameSpace((Split-Path $file -Parent))

$dest.CopyHere($zip.Items())