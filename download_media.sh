#!/bin/sh

mkdir tmp media # FIXME: change media2 to media
cd tmp
wget -r -np -A m4f,mp4,mpd http://www.bok.net/dash/tears_of_steel/cleartext/
mv www.bok.net/dash/tears_of_steel/cleartext/* ../media
cd ..
rm -rf tmp
