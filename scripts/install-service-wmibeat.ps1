# delete service if it already exists
if (Get-Service wmibeat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='wmibeat'"
  $service.StopService()
  Start-Sleep -s 1
  $service.delete()
}

$workdir = Split-Path $MyInvocation.MyCommand.Path

# create new service
New-Service -name wmibeat `
  -displayName wmibeat `
  -binaryPathName "`"$workdir\\wmibeat.exe`" -c `"$workdir\\wmibeat.yml`" -path.home `"$workdir`" -path.data `"C:\\ProgramData\\wmibeat`""
