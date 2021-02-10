#!/usr/bin/awk -f

BEGIN {
	FS = "/";
	n = 0;
}

{

Artists[n] = $3;
Albums[n] = $4;
gsub(".ogg", "");
Songs[n] = $5;

gsub(/"/,"\\\"");
Links[n] = $0; 
#n++;

if (prevArtist != $3)
{
        nAlbumsPerArtist[$3] = 1;
}
else if (prevAlbum != $4)
{
        nAlbumsPerArtist[$3] += 1;
}

prevAlbum = $4;
prevArtist = $3;

n++;

}

END {
for (i=0;i < n; i++)
{

	#starting a new artist
	if (i != 0)
	{
		if (Artists[i-1] != Artists[i])
		{
			printf "<tr>\n"
			printf "<td rowspan=\"%s\">%s</td>\n", nAlbumsPerArtist[Artists[i]], Artists[i];
		}
		#starting a new album
		if (Albums[i-1] != Albums[i])
		{
			printf "<td>%s</td>\n", Albums[i];
			printf "<td>\n";
			printf "<table border=\"0\">\n";
		}
	}
	else
	{
		 printf "<td rowspan=\"%s\">%s</td>\n", nAlbumsPerArtist[Artists[i]], Artists[i];

		 printf "<td>%s</td>\n", Albums[i];
                 printf "<td>\n";
                 printf "<table border=\"0\">\n";
	}
	
	#print the song
	printf "<tr><td><a href=\"%s.ogg\">%s</a></td></tr>\n", Links[i], Songs[i];  

	#closing an old album
	if (Albums[i] != Albums[i+1])
	{
		printf "</table>\n";
		printf "</td>\n";
		printf "</tr>\n";
	}

	#closing an old artist
	if (Artists[i] != Artists[i+1])
	{
		
	}

}

}





