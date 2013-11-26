use strict;
use File::Find;
use DBI;

my $rootpath;
my $foldername;
my $system;

my $file = 'Data/iisLog.log';
my $host = 'localhost';
my $database = 'mydb';
my $dbh = DBI->connect("DBI:mysql:database=$database;host=$host",
                      "perl", "hacker", {RaiseError => 1});

sub trollFiles() {
	if(-f && m/\.(asmx|svc|aspx)$/) {		 
		
		s/\\/\\\\/g for (my $rootPathEscaped = $rootpath);
		s/$rootPathEscaped//;
		s/^[\\](.*)/\/$1/;
		my $insertQuery = sprintf("INSERT INTO mydb.systempathmap
							(System,Path) 
							VALUES 
							('%s', '%s');"
							,$system,$_);
		$dbh->do($insertQuery) or warn print "Warn";

	}
}

open(FH,'C:\Dev\Proto\Perl\Data\systemMap');
while(<FH>) {
	($rootpath, $foldername, $system) = /(.*)(\\\w+) (\w+)$/;
	my $fullPath = $rootpath . $foldername;
	find({wanted => \&trollFiles, no_chdir => 1}, "$fullPath");
}

