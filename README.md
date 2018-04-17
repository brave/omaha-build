### Bring up vagrant box
vagrant box add -n vs2015community https://<vagrant_box_url>
vagrant up
vagrant reload

### Manual steps
* Install C:\tmp\pywin32.exe
* Install C:\tmp\scons.exe
* In cmd prompt:
** `cd C:\omaha\omaha`
** `C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat`
** `hammer`
