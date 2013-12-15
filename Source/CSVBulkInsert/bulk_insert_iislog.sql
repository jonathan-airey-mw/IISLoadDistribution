use mydb;


load data local infile 'C:/Dev/Proto/Perl/Data/iisLogout.csv' into table iisimport
fields terminated by ','
enclosed by ''''
lines terminated by '\n'
(QueryDate, Path, IP, IPDecimal)