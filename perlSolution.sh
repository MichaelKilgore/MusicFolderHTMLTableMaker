#!/bin/sh

# Author : Michael Kilgore

musicfolder=$1

echo "<html>" >> AudioFiles.html
echo "<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />" >> AudioFiles.html
echo "<body>" >> AudioFiles.html
echo "<table border=\"1\">" >> AudioFiles.html
echo "<tr>" >> AudioFiles.html
echo "<th>Artist</th>" >> AudioFiles.html
echo "<th>Album</th>" >> AudioFiles.html
echo "<th>Tracks</th>" >> AudioFiles.html
echo "</tr>" >> AudioFiles.html


#creates temp file that has 'number of albums/Artist in the file

find $musicfolder -name '*.ogg' | perl -pe 's#//#/#' | sort -t '/' -k3,4 | perl -pe 's#/disk1/#/disk1 - #' | perl -pe 's#/disk2/#/disk2 - #' | perl -pe 's#/disk3/#/disk3 - #' |perl -pe 's#/disk4/#/disk4 - #' | ./script.pl >> AudioFiles.html

echo "</table>" >> AudioFiles.html
echo "</body>" >> AudioFiles.html
