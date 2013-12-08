
echo Updating GeoLocation IP Addresses 

echo Truncating existing tables first...

mysql -h localhost -u test < C:\git\IISLoadDistribution\Source\CSVBulkInsert\truncate.sql

echo Updating tables...

mysql -h localhost -u test < C:\git\IISLoadDistribution\Source\CSVBulkInsert\bulk_insert_ipblocks.sql

mysql -h localhost -u test < C:\git\IISLoadDistribution\Source\CSVBulkInsert\bulk_insert_iplocations.sql


echo Bulk insert completed...

pause Do you want to exit this window?

 