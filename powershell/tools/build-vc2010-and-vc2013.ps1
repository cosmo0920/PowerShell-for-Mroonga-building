$vcVers = "vc2010", "vc2013"
cd ..
foreach ($vcVer in $vcVers) {
  .\build-ci-core.ps1
}
