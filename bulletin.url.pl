#!/usr/bin/perl

use warnings;
use strict;
use HTTP::Request;
use LWP::UserAgent;

my $year;
my $month;
my $fiscal_year;
my $curDate = 201710;
my $url;
my $monthStr;

my %monthMap = (
    1  => "january",
    2  => "february",
    3  => "march",
    4  => "april",
    5  => "may",
    6  => "june",
    7  => "july",
    8  => "august",
    9  => "september",
    10 => "october",
    11 => "november",
    12 => "december",
);

for ($year=2015;$year<2018;$year++) {
    for ($month=1;$month<=12;$month++) {
        next if ($year * 100 + $month > $curDate);
        if ($month >= 10) {
            $fiscal_year = $year + 1;
        } else {
            $fiscal_year = $year;
        }
        $monthStr = $monthMap{$month};
        if ($month < 10) {
            $url = "curl https://travel.state.gov/content/visas/en/law-and-policy/bulletin/$fiscal_year/visa-bulletin-for-$monthStr-$year.html > tmp/${year}0$month";
        } else {
            $url = "curl https://travel.state.gov/content/visas/en/law-and-policy/bulletin/$fiscal_year/visa-bulletin-for-$monthStr-$year.html > tmp/$year$month";
        }
        print "$url\n";
    }
}
