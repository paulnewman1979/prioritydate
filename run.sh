#!/bin/bash

./bulletin.url.pl > curl.url.sh

chmod +x curl.url.sh
#./curl.url.sh

cd tmp/
ls -1 > ../list.txt
cd ../

> result.txt
for file in `cat list.txt`
do
    result=`cat tmp/$file | ./getdate.pl`
    echo "$file $result" >> result.txt
done
