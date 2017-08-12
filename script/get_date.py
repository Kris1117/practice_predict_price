import datetime

# start from today
start_date = datetime.datetime.now()
target_date = start_date - datetime.timedelta(days=1)
end_date = start_date - datetime.timedelta(days=10)

while (1):
    print 'Target Date : ', target_date.strftime("%Y%m%d")
    if (target_date < end_date):
        break
    target_date = target_date - datetime.timedelta(days=1)
