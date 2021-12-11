#!/usr/bin/perl -w
#@Author : Dot4diw
#@Filename : filterFastq.pl
#@Build time : 3/2020
#@Function : Filter the fastq files by reads length.
#@Usage example : perl filterFasta.pl inputfile.fastq minLength maxLength outputfile.fastq.

use strict;
use warnings;

my $args       =  @ARGV;
my $inputfile  =  $ARGV[0];
my $minLength  =  $ARGV[1];
my $maxLength  =  $ARGV[2];
my $outputfile =  $ARGV[3];
my $usage      =  qq{$0 input_fastq minLength maxLength output.fastq};

if ($args != 4){
        die "$usage\n";
}

open(INDATA, "$inputfile") or die "Can't open $inputfile,$!\n";
open(OUTDATA, "$outputfile") or die "Can't open $inputfile,$!\n";


while (my $line= <DATA>) {
        chomp $line;
        chomp (my $sequence  = <DATA>);
        chomp (my $comment   = <DATA>);
        chomp (my $quality   = <DATA>);
        my $targetSeq   = (length $sequence >= $minLength && length $sequence <= $maxLength) ? "$sequence" : "";
        my $targetQuality  = $quality;
        if ($targetSeq != ""){
                print OUTDATA qq{$line\n$targetSeq\n$comment\n$targetQuality\n};
        }

close INDATA  || die "Can't close the $inputfile,$!\n";
close OUTDATA || die "Can't close the $outputfile, $!\n";
