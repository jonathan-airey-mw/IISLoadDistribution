my $file = 'C:\Dev\Proto\Perl\Data\iisLogout.csv';

open (FH, ">>$file") or die "$!";
print FH "sitepoint, 2, 7\n";
#print FH "google, 4, 3\n";
close(FH);