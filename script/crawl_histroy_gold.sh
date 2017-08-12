#!/bin/bash

# set -x

SGE_URL="http://www.sge.com.cn"
HISTORY_PAGE="/sjzx/mrhqsj"

TEMP_FILE="temp.html"
HISTORY_PAGE_LIST="page.list"
HISTORY_PRICE_FOLDER="../history_data/history_gold_price"
DELETE_LINE="d"
END_LINE="$"

# get the first to check total page size

curl $SGE_URL$HISTORY_PAGE > $TEMP_FILE
TOTAL_PAGE=`cat $TEMP_FILE | grep totalPage= | sed 's/.*totalPage=//g' | sed 's/;//g' | sed 's/\r//g'`

echo "clean $HISTORY_PAGE_LIST"
rm $HISTORY_PAGE_LIST

for PAGE_NUM in `seq 1 $TOTAL_PAGE`; do
	curl $SGE_URL$HISTORY_PAGE"?p="$PAGE_NUM > $TEMP_FILE
	cat $TEMP_FILE | grep "<a href=\"/sjzx/mrhqsj/" | sed 's/.*<a href="//g' | sed 's/" class="title.*//g' >> $HISTORY_PAGE_LIST
done

mkdir -p $HISTORY_PRICE_FOLDER

for TEMP_URL in $(cat $HISTORY_PAGE_LIST); do
	PAGE_NAME=`echo $TEMP_URL | sed 's/.*\///g' | sed 's/?.*//g'`
	curl $SGE_URL$TEMP_URL > $TEMP_FILE
	PAGE_DATE=`cat $TEMP_FILE | grep "<\/i>[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]" | sed 's/.*<\/i>//g' | sed 's/<\/.*//g' | sed 's/-//g'`
	w3m $TEMP_FILE -dump | grep -e Ag -e Au -e Pt > $HISTORY_PRICE_FOLDER/$PAGE_DATE"_"$PAGE_NAME
done

rm $TEMP_FILE
