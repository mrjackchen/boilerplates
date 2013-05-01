#!/usr/bin/perl

use strict;
use Getopt::Std;

use vars qw($pgm);

($pgm = $0) =~ s|.*\/||;        # basename this program

use vars qw($opt_d $opt_h $opt_n $opt_v);


sub usage {
  print "\nUsage: $pgm [-d] [-h] [-n] [-v] iNpUT_FilE\n"; 
  print "\t-d debug\n";
  print "\t-h displays this message\n";
  print "\t-n outputs actions, but does nothing\n";
  print "\t-v verbose\n\n";
}

unless (getopts('dhnv') && $#ARGV == 0) {
    usage;
    exit 1;
}

if ($opt_h) {
    usage;
    exit 0;
}

sub vmsg {
    print STDERR "@_\n" if $opt_v;
}

my $INPUT_FILE = $ARGV[0];

{
    vmsg("\nBEGIN $pgm");
    vmsg("\tusing $INPUT_FILE");
    vmsg("END $pgm\n\n");
    exit 0;
}
