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

find $musicfolder -name '*.ogg' | sed 's#/##' | sort -t '/' -k3,4 | awk '{gsub("/disk1/", "/disk1 - ")} {gsub("/disk2/", "/disk2 - ")} {gsub("/disk3/", "/disk3 - ")} {gsub("/disk4/", "/disk4 - ")}  {print $0}' | ./script.awk >> AudioFiles.html 

echo "</table>" >> AudioFiles.html
echo "</body>" >> AudioFiles.html








