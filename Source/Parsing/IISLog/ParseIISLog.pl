use strict;
use DBI;

my $file = 'Data/iisLog.log';
my $host = 'localhost';
my $database = 'mydb';
my $dbh = DBI->connect("DBI:mysql:database=$database;host=$host",
                      "perl", "hacker", {RaiseError => 1});

open(FH, $file) or die $!;
my $truncateQuery = sprintf("TRUNCATE TABLE mydb.iisimport");
		$dbh->do($truncateQuery) or warn print "WARN";

while (<FH>) {
	if (m`^(\d+-\d+-\d+\s\d+:\d+:\d+) \w+ [\d+\.]+ \w+ ([\w\/\.]+) [-\w]+ [-\w]+ [-\w]+ (\d+\.\d+\.\d+\.\d+)`) {
		my $insertQuery = sprintf("INSERT INTO mydb.iisimport 
							(QueryDate,Path,IP) 
							VALUES 
							('%s', '%s', '%s');"
							,$1,$2,$3);
		$dbh->do($insertQuery) or warn print "WARN";
	};
}