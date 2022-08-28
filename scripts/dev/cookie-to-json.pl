use strict;
use warnings;
use feature qw(say);

my ($cookies) = @ARGV;

my %table;

while ( $cookies =~ m/(.*?)\=(.*?)\;/g ) {
    say $1;
    say;
    say $2;
    $table{$1} = $2;
}
