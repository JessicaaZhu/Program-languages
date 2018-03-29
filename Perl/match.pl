open FILE, "input.txt" or die $!;
my $word = "";
while (<FILE>){
	$word = "$_";
    chomp $word;
	if($word=~m/or/){print "$word contains or\n";}
	if($word=~m/\w*[aeiou]\w*[aeiou]\w*/){print "$word contains at least two vowel letters\n";}
	if($word=~m/^[^h]/){print "$word does not start with h\n";}
	if(($word=~m/[0-9a-z]e\w/) && ($word=~m/y$/)){print "$word 0phas e as second symbol and ends with y\n";}
	if(($word=~m/[a-z]+/) && ($word=~m/[0-9]+/)){print "$word contains both letters and digits\n";}
}
close FILE;
