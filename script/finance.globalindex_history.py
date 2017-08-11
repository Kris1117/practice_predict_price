import json,urllib
from urllib import urlencode
import mod_utils

url = mod_utils.getConfig("crawldata", "url")
appkey = mod_utils.getConfig("crawldata", "appkey")
sign = mod_utils.getConfig("crawldata", "sign")

target_date = '20170808'

params = {
  'app' : 'finance.globalindex_history',
  'inxid' : '2',
  'date' : target_date,
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
		print 'Get data success!'
		mod_utils.saveJson(target_date + '.globalindex_history', a_result['result'])
	else:
		print a_result['msgid']+' '+a_result['msg']
else:
	print 'Request nowapi fail.'
