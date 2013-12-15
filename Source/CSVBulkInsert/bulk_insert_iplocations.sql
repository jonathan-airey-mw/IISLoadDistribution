use mydb;

load data local infile 'C:/git/IISLoadDistribution/Source/CSVBulkInsert/GeoLiteCity-Location.csv' into table ip_location
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
(locId, country, region,city,postalCode,latitude,longitude,metroCode,areaCode) 

