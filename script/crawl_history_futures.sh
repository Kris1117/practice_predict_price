#!/bin/bash

FUTURES_HISTORY_URL="http://stockq.cn"
HISTORY_LIST="history_stock_url_list"
HISTORY_FUTURES_DATA_FOLDER="../history_data/history_futures_data"
TEMP_FILE="history_futures_temp.html"
TEMP_DATA="history_futures_tempdata"

mkdir -p $HISTORY_FUTURES_DATA_FOLDER

for URL in $(cat history_stock_url_list); do
    DATE_STR=`echo $URL | sed 's/\// /g' | sed 's/_gb.*//g' | awk '{print $5}'`
    curl "$FUTURES_HISTORY_URL$URL" > $TEMP_FILE
    sed -i '/table/d' $TEMP_FILE
    w3m $TEMP_FILE -dump > $TEMP_DATA
	IFS=$'\n'
    for ITEM in $(cat futures_list); do
        cat $TEMP_DATA | grep $ITEM -m 1 >> $HISTORY_FUTURES_DATA_FOLDER/$DATE_STR
    done
done

rm $TEMP_DATA
rm $TEMP_FILE
