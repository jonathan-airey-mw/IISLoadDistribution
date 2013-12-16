$storageDir = $pwd

$webClient = New-Object System.Net.WebClient
$url = "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity_CSV/GeoLiteCity-latest.zip"
$file = "$storageDir\GeoLiteCity-latest.zip"
$webclient.DownloadFile($url, $file)

#This part unzips the file.

Remove-Item "C:\Users\gawaineo\Desktop\Perl scipts - traffic project\downloads\csv_files\*" -Force -Recurse -ErrorAction SilentlyContinue

$shell = new-object -com shell.application
$zip = $shell.nameSpace($file)

foreach($item in $zip.items())
{
	$shell.namespace("C:\Users\gawaineo\Desktop\Perl scipts - traffic project\downloads\csv_files").copyhere($item)
}