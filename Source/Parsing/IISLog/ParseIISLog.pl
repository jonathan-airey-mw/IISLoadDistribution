use strict;
use DBI;

my $file = 'C:\Dev\Proto\Perl\Data\iisLog.log';
my $outfile = 'C:\Dev\Proto\Perl\Data\iisLogout.csv';
`del C:\\Dev\\Proto\\Perl\\Data\\iisLogout.csv`;
open (FH2, ">>$outfile") or die "$!";
my $host = 'localhost';
my $database = 'mydb';
my $dbh = DBI->connect("DBI:mysql:database=$database;host=$host",
                      "perl", "hacker", {RaiseError => 1});

open(FH, $file) or die $!;
my $truncateQuery = sprintf("TRUNCATE TABLE mydb.iisimport");
		$dbh->do($truncateQuery) or warn print "WARN";

while (<FH>) {
	if (m`^(\d+-\d+-\d+\s\d+:\d+:\d+) \w+ [\d+\.]+ \w+ ([\w\/\.]+) [-\w]+ [-\w]+ [-\w]+ (\d+\.\d+\.\d+\.\d+)`) {
		my $ipdecimal = ipAddr2IPNumber($3);
		my $insertQuery = sprintf("'%s', '%s', '%s', %s);"
							,$1,$2,$3,$ipdecimal);
		print FH2 "$insertQuery\n";
	};
}
close(FH2);

sub ipAddr2IPNumber{
	my ($ipAddress) = @_;

	my @ipBlocks = ();

	if($ipAddress =~ m/(\d+).(\d+).(\d+).(\d+)/)
	{
		#print "$1 $2 $3 $4\n";
		$ipBlocks[0] = $1;
		$ipBlocks[1] = $2;
		$ipBlocks[2] = $3;
		$ipBlocks[3] = $4;
	}

	my $num = 16777216*$ipBlocks[0] + 65536*$ipBlocks[1] + 256*$ipBlocks[2] + $ipBlocks[3]; 

	return $num;
}