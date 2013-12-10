$storageDir = $pwd

$webClient = New-Object System.Net.WebClient
$url = "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity_CSV/GeoLiteCity-latest.zip"
$file = "$storageDir\GeoLiteCity-latest.zip"
$webclient.DownloadFile($url, $file)