$stable = "source.zip"
$nightly = "source-nightly.zip"
if (Test-Path -path "$stable") {
  $zipname = "$stable"
}
if (Test-Path -path "$nightly") {
  $zipname = "$nightly"
}

$file = $(Get-ChildItem $zipname).FullName

#Load the assembly
[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
[System.IO.Compression.ZipFile]::ExtractToDirectory($file, $pwd)