$ErrorActionPreference = "Stop"

mkdir -Force \tmp
cd \tmp

choco install -y curl
choco install -y windows-sdk-10

#brave-browser
curl.exe -o node.msi -L 'https://nodejs.org/dist/v8.11.1/node-v8.11.1-x86.msi'
Start-Process -NoNewWindow -Wait -FilePath msiexec.exe -ArgumentList "/passive", "/i", "C:\tmp\node.msi", "/l*v", "node.log"

curl.exe -L -o yarn.msi https://yarnpkg.com/latest.msi
Start-Process -NoNewWindow -Wait -FilePath msiexec.exe -ArgumentList "/passive", "/i", "C:\tmp\yarn.msi", "/l*v", "yarn.log"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files (x86)\Yarn\bin", [EnvironmentVariableTarget]::Machine)
