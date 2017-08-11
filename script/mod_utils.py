import ConfigParser
import os
import json
import io


def getConfig(section, key):
    config = ConfigParser.ConfigParser()
    path = os.path.split(os.path.realpath(__file__))[0] + '/crawldata.conf'
    config.read(path)
    return config.get(section, key)

def saveJson(filename, data):
	datafolder = getConfig("crawldata", "datafolder")
	filepath = os.path.split(os.path.realpath(__file__))[0] + '/' + datafolder + '/' + filename

	with io.open(filepath, 'w', encoding='utf8') as outfile:
		str_ = json.dumps(data, indent=4, sort_keys=True, separators=(',', ': '), ensure_ascii=False)
		outfile.write(unicode(str_))
