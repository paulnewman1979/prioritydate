#!/usr/bin/perl

use warnings;
use strict;

my $line;
my $status = 0;
my $date1;
my $date2 = "";

while ($line=<STDIN>) {
    if ($line=~/2nd/) {
        $status++;
    } elsif ($status == 1) {
        if ($line=~/\<td\>(\d+[A-Z]+\d+)\<\/td\>/) {
            $date1 = $1;
            $status++;
        }
    } elsif ($status == 3) {
        if ($line=~/\<td\>(\d+[A-Z]+\d+)\<\/td\>/) {
            $date2 = $1;
            $status++;
        }
    }
}

if ($date2 ne "") {
    print "$date1\t$date2\n";
} else {
    print "$date1\n";
}
