import json,urllib
from urllib import urlencode

url = 'https://sapi.k780.com'

params = {
  'app' : 'finance.shgold_history',
  'goldid' : '1051',
  'date' : '20170515',
  'appkey' : '27351',
  'sign' : '46b69d60548dfbd8871303ca750156a1',
  'format' : 'json',
}

params = urlencode(params)

f = urllib.urlopen('%s?%s' % (url, params))
nowapi_call = f.read()
#print content
a_result = json.loads(nowapi_call)

if a_result:
    if a_result['success'] != '0':
        print (a_result['result'])
    else:
        print (a_result['msgid']+' '+a_result['msg'])
else:
    print ('Request nowapi fail.')

