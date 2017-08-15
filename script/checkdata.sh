#!/bin/bash

HISTORY_EXCHANGE_DATA_FOLDER="../history_data/history_exchange_data"
HISTORY_FUTURES_DATA_FOLDER="../history_data/history_futures_data"
HISTORY_STOCK_DATA_FOLDER="../history_data/history_stock_data"

URL_LIST="history_stock_url_list"

for URL in $(cat $URL_LIST); do
	DATE_STR=`echo $URL | sed 's/\// /g' | sed 's/_gb.*//g' | awk '{print $5}'`
	if [ -s $HISTORY_STOCK_DATA_FOLDER/$DATE_STR ]; then
		echo "Found : $HISTORY_STOCK_DATA_FOLDER/$DATE_STR"
	else
		echo "Miss  : $HISTORY_STOCK_DATA_FOLDER/$DATE_STR"
	fi

	if [ -s $HISTORY_EXCHANGE_DATA_FOLDER/$DATE_STR ]; then
		echo "Found : $HISTORY_EXCHANGE_DATA_FOLDER/$DATE_STR"
	else
		echo "Miss  : $HISTORY_EXCHANGE_DATA_FOLDER/$DATE_STR"
	fi

	if [ -s $HISTORY_FUTURES_DATA_FOLDER/$DATE_STR ]; then
		echo "Found : $HISTORY_FUTURES_DATA_FOLDER/$DATE_STR"
	else
		echo "Miss  : "$HISTORY_FUTURES_DATA_FOLDER/$DATE_STR
	fi
done
