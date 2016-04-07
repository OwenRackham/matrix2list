#!/usr/bin/env perl


use strict;
use warnings;
use Data::Dumper;
my $matrix = $ARGV[0];
my $annotation_limit = $ARGV[1];
my $colheader = $ARGV[2];
my $header_limit = $ARGV[3];
my $count = 0;

my $delim = "\t";

my @cols;
if(defined($colheader)){
	open COLS,$colheader;
	while(<COLS>){
		chomp;
		push @cols,$_;
	}
}
#print Dumper \@cols;

open FILE,$matrix;

while(<FILE>){
	chomp;
	unless($_ =~ ">#"){
			my @line = split('\t',$_);
			#print Dumper \@line;
			my @slice = @line[0 .. ($annotation_limit-1)];
			for(my $index=$annotation_limit;$index<=$#line;$index++){
				print $cols[$index]."\t";
				print join("\t",@slice);
				print "\t";
				print $line[$index];
				print "\n";
			}



	} 

}

