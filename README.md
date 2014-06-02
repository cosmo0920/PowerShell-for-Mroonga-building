Tiny PowerShell Script to build Mroonga under Windows environment
===

## Project structure

```log
---source.zip
 |
 -- batfiles/*.bat # put mroonga bat file
 |
 -- *.ps1
```

## versions.ps1

```powershell
$workDir = [specify workdir]
$mariadbVer = [specify mariaDB version]
$mroongaVer = [specify Mroonga version]
```

## execution order ps1

```bat
powershell> get-mroonga.ps1
powershell> unzip.ps1
powershell> prepare-building-mroonga.ps1
cmd> <building Mroonga....>
powershell> package-unzip.ps1
powershell> install-mroonga.ps1
powershell> create-mrnzip.ps1
```

### Environment

For Windows 8.1.

### LICENSE

[MIT](LICENSE).
