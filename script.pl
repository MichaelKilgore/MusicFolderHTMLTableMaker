#!/usr/bin/perl -n
#adding l to end of n adds a new line to each argument printed
#the -n says run program for each argument sent through the pipe.


BEGIN {
	$x = 1;
	%nAlbumsPerArtist = ();
}


chomp();

$_ =~ s/.ogg//g;
@fields = split('/', $_);

$Artists[$x] = $fields[2];
$Albums[$x] = $fields[3];
$Songs[$x] = $fields[4];

$_ =~ s/"/\\"/g;
$Links[$x] = $_;


if ($prevArtist ne $fields[2])
{
        $nAlbumsPerArtist{$Artists[$x]} = 1;
}
elsif ($prevAlbum ne $fields[3])
{
        $nAlbumsPerArtist{$Artists[$x]} += 1;
}


$prevAlbum = $fields[3];
$prevArtist = $fields[2];


$x += 1;



END {


for (my $i=1; $i <= $x; $i++)
{


	#starting a new artist
        if ($i ne 0)
        {
                if ($Artists[$i-1] ne $Artists[$i])
                {
                        printf "<tr>\n";
			print "<td rowspan=\"$nAlbumsPerArtist{$Artists[$i]}\">$Artists[$i]</td>\n";
                }
                #starting a new album
                if ($Albums[$i-1] ne $Albums[$i])
                {
                        printf "<td>%s</td>\n", $Albums[$i];
                        printf "<td>\n";
                        printf "<table border=\"0\">\n";
                }
        }
        else
        {
		 printf "<tr>\n";
                 printf "<td rowspan=\"%s\">%s</td>\n", $nAlbumsPerArtist[$Artists[$i]], $Artists[$i];

                 printf "<td>%s</td>\n", $Albums[$i];
                 printf "<td>\n";
                 printf "<table border=\"0\">\n";
        }

        #print the song
        printf "<tr><td><a href=\"%s.ogg\">%s</a></td></tr>\n", $Links[$i], $Songs[$i];

	#closing an old album
        if ($Albums[$i] ne $Albums[$i+1])
        {
                printf "</table>\n";
                printf "</td>\n";
                printf "</tr>\n";
        }



}


}





