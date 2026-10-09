# PowerShell, run.ps1, Windows PowerShell 5.1
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$path = Join-Path $env:TEMP ('optimizer-' + [guid]::NewGuid() + '.exe')
$url = 'https://raw.githubusercontent.com/optimizergoh/optimizer/9df7b5db2dfb1d0149921c3b1d855b4a3bc48124/optimizer.exe'
Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $path
if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne '2750459C5F5592D469B4325DADAB657E133FF4BCC784EAECD5AE21CF81C927C1') {
    Remove-Item -LiteralPath $path
    throw 'Downloaded file does not match the published file.'
}
Start-Process -FilePath $path
