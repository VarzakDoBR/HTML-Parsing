#!/bin/bash
cor='\033[0;32m'
if [ "$1" = ""]
then

echo "Favor insira uma URL"

else

rm lista
rm index.html

wget $1 2> /dev/null

cat index.html | grep "href" | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v '<' | uniq -u > lista

for url in $(cat lista);
do

printf "${cor}"

host $url | grep "has address"


done

fi
