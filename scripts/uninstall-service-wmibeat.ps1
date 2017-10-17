# delete service if it exists
if (Get-Service wmibeat -ErrorAction SilentlyContinue) {
  $service = Get-WmiObject -Class Win32_Service -Filter "name='wmibeat'"
  $service.delete()
}
