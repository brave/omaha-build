mkdir \tmp
cd \tmp

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

powershell -ExecutionPolicy Bypass -Command "choco install visualstudio2015community -y -packageParameters '--AdminFile C:\Windows\Temp\vs_2015.xml' --execution-timeout 14400"
powershell -ExecutionPolicy Bypass -Command "Enable-WindowsOptionalFeature -Online -FeatureName 'NetFx3' -NoRestart"
shutdown /r /t 0
exit 0
