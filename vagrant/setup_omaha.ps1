$ErrorActionPreference = "Stop"

mkdir -Force \tmp
cd \tmp


$protobuf_ver="3.5.1"
$Env:MSSdk = "C:\Program Files (x86)\Microsoft SDKs\Windows\v8.1A\"
choco install -y sysinternals
choco install -y curl 
choco install -y sysinternals

curl.exe -L -o wix.exe https://github.com/wixtoolset/wix3/releases/download/wix3111rtm/wix311.exe 
curl.exe -o python.msi https://www.python.org/ftp/python/2.4.4/python-2.4.4.msi
curl.exe -o pywin32.exe https://versaweb.dl.sourceforge.net/project/pywin32/pywin32/Build216/pywin32-216.win32-py2.4.exe
curl.exe -L -o scons.exe https://astuteinternet.dl.sourceforge.net/project/scons/scons/1.3.1/scons-1.3.1.win32.exe
curl.exe -o setup_tools.tar.gz https://pypi.python.org/packages/source/s/setuptools/setuptools-0.9.6.tar.gz
curl.exe -o wtl.zip https://phoenixnap.dl.sourceforge.net/project/wtl/WTL%2010/WTL%2010.0.7336/WTL10_7336.zip
curl.exe -o atlserver.zip https://codeplexarchive.blob.core.windows.net/archive/projects/AtlServer/AtlServer.zip
curl.exe -o swtoolkit.zip https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/swtoolkit/swtoolkit.0.9.1.zip

curl.exe -L -o protobuf.zip "https://github.com/google/protobuf/releases/download/v3.5.1/protobuf-cpp-${protobuf_ver}.zip"
curl.exe -L -o protoc.zip "https://github.com/google/protobuf/releases/download/v3.5.1/protoc-${protobuf_ver}-win32.zip"

Expand-Archive -Force .\protobuf.zip
cp -Force .\protobuf\protobuf-${protobuf_ver}\src \protobuf\src

Expand-Archive -Force .\protoc.zip -DestinationPath C:\protobuf\

Start-Process -NoNewWindow -Wait -FilePath msiexec.exe -ArgumentList  "/l*v", "python.log", "/passive", "/i", "python.msi", "TARGETDIR=C:\Python24", "ALLUSERS=1"
$env:PATH = "C:\Python24;$env:PATH"


Expand-Archive -Force .\atlserver.zip
Expand-Archive -Force .\atlserver\sourceCode\sourceCode.zip -DestinationPath \atl

# Permission denied errors, need to install manually for now
# curl.exe -L -o ez_setup.py https://bitbucket.org/pypa/setuptools/downloads/ez_setup.py
# C:\Python24\python ez_setup.py --download-base=.\setuptools-0.9.6.tar.gz
# C:\Python24\Scripts\easy_install.exe .\pywin32.exe
# C:\Python24\Scripts\easy_install.exe .\scons.exe --standard-lib


Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3"
Start-Process -NoNewWindow -Wait -FilePath .\wix.exe -ArgumentList  "/l*v", "wix.log", "/passive"

Expand-Archive -Force .\wtl.zip -DestinationPath C:\wtl
Expand-Archive -Force .\atlserver.zip -DestinationPath C:\atl
Expand-Archive -Force .\swtoolkit.zip -DestinationPath C:\swtoolkit