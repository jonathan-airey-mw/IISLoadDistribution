use mydb;


load data local infile 'C:/git/IISLoadDistribution/Source/CSVBulkInsert/GeoLiteCity-Blocks.csv' into table ip_num_blocks
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
(startIpNum, endIpNum, locId)