import json,urllib
from urllib import urlencode
import time
import datetime
import mod_utils

url = mod_utils.getConfig("crawldata", "url")
appkey = mod_utils.getConfig("crawldata", "appkey")
sign = mod_utils.getConfig("crawldata", "sign")
datafolder = mod_utils.getConfig("crawldata", "datafolder")
history_days = mod_utils.getConfig("crawldata", "history_days")

datafolder = datafolder + "/history_globalindex/"
# start from today
start_date = datetime.datetime.now()
target_date = start_date - datetime.timedelta(days=1)
end_date = start_date - datetime.timedelta(days=int(history_days))

while (1):
    target_date_str = target_date.strftime("%Y%m%d")
    print 'Target Date : ' + target_date_str
    if (target_date <= end_date):
        break

    target_date = target_date - datetime.timedelta(days=1)

    for globalindex in range(1,51): # 50 index per day
        print '====='
        print '===== Target Global Index ' + str(globalindex) + "====="
        print '====='

        params = {
            'app' : 'finance.globalindex_history',
            'inxid' : globalindex,
            'date' : target_date_str,
            'appkey' : appkey,
            'sign' : sign,
            'format' : 'json',
        }

        params = urlencode(params)
        f = urllib.urlopen('%s?%s' % (url, params))

        nowapi_call = f.read()
        #print content
        a_result = json.loads(nowapi_call)

        if a_result:
            if a_result['success'] != '0':
                print 'Get data success! Date ' + target_date_str + ', Index : ' + str(globalindex)
                mod_utils.saveJson(datafolder + target_date_str + '_globalindex_history_' + str(globalindex), a_result['result'])
                print 'Need to sleep 1 min betweem each globalindex'
                # time.sleep(60)
            else:
                print a_result['msgid']+' '+a_result['msg']
                print 'Failed to get data, date : ' + target_date_str + ' index : ' + str(globalindex)
        else:
            print 'Request nowapi fail.'

    print 'Need to sleep 10 mins for new date'
    #time.sleep(610)

