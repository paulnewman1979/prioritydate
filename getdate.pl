#!/usr/bin/perl

use warnings;
use strict;

my $line;
my $status = 0;
my $date1;
my $date2 = "";
my $date3;
my $date4 = "";

while ($line=<STDIN>) {
    if ($line=~/2nd/) {
        $status++;
    } elsif ($line=~/3rd/) {
        $status++;
    } elsif ($status == 1) {
        if ($line=~/\<td\>(\d+[A-Z]+\d+)\<\/td\>/) {
            $date1 = $1;
            $status++;
        }
    } elsif ($status == 3) {
        if ($line=~/\<td\>(\d+[A-Z]+\d+)\<\/td\>/) {
            $date3 = $1;
            $status++;
        }
    } elsif ($status == 5) {
        if ($line=~/\<td\>(\d+[A-Z]+\d+)\<\/td\>/) {
            $date2 = $1;
            $status++;
        }
    } elsif ($status == 7) {
        if ($line=~/\<td\>(\d+[A-Z]+\d+)\<\/td\>/) {
            $date4 = $1;
            $status++;
        }
    }

}

if ($date2 ne "") {
    print "$date1\t$date2\t";
} else {
    print "$date1\t\t\t";
}

if ($date4 ne "") {
    print "$date3\t$date4\n";
} else {
    print "$date3\n";
}
