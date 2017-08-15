#!/bin/bash

EXCHANGE_HISTORY_URL="http://stockq.cn"
HISTORY_LIST="history_stock_url_list"
HISTORY_EXCHANGE_DATA_FOLDER="../history_data/history_exchange_data"
TEMP_FILE="history_exchange_temp.html"
TEMP_DATA="history_exchange_tempdata"

mkdir -p $HISTORY_EXCHANGE_DATA_FOLDER

for URL in $(cat history_stock_url_list); do
    DATE_STR=`echo $URL | sed 's/\// /g' | sed 's/_gb.*//g' | awk '{print $5}'`
    curl "$EXCHANGE_HISTORY_URL$URL" > $TEMP_FILE
    sed -i '/table/d' $TEMP_FILE
    w3m $TEMP_FILE -dump > $TEMP_DATA
    for ITEM in $(cat exchange_list); do
        cat $TEMP_DATA | grep $ITEM -m 1 >> $HISTORY_EXCHANGE_DATA_FOLDER/$DATE_STR
    done
done

rm $TEMP_DATA
rm $TEMP_FILE
