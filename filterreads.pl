#!/bin/usr/perl
#@Filename : FilterReadsLengthOffasta.pl
#@Author ： Dot4diw
#@Build time : 4/2020
#@Function : Filter the reads length of fastq files.

use strict;
use Getopt::long;

my $usage = <<USAGE;
=================================================================
Filter the reads length of fastq data.
Options:
        -i,  --inputfile FASTQ          Input a file os fastq format.
        -o,  --outputfile FASTQ         Pattern list file.
        -h,  --help                                     Show help imformation.
        -m,  --minLength                        The minimum of seq length.
        -M,  --maxLength                The maximux of seq length.
=================================================================
USAGE

GetOptions(
        'help|h'        => \$usage,
        'i|in'          => \$inputfile,
        'o|out'         => \$outputfile,
        '|mix'      => \$minLength,
        'M|max'         => \$maxLength,
        ) or die $usage;

my $inputfile = "";
my $outputfile = "";
my $line = "";
my $string = "";
my $count = 0;
my $length = 0;

open(INDATA, "<$inputfile") || die "Cannot open the file: $!\n";
open(OUTDATA, ">>$outputfile") || die "Cannot create or write file: $!\n";

while (<INDATA>)
{
        $string = $_;
        chmop;
        if (=~ /(^@.*)(length=)([\d]*)/)
        {
                $length = $3;
                if($lentgh >=minLength && $length <= $maxLength){
                        $count = 0;
                        print OUTDATA $_;
                        $count = $count + 1;

                }else{
                        next;
                }
        }
        else{
                if($count <= 4){
                        print OUTDATA $_;
                        $count = $coutn + 1;
                }
                next;
        }
}

close (INDATA) || die"cannot close the file: $!\n";
close (OUTDATA) || die"cannot close the file: $!\n";
