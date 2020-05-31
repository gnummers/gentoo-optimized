import os
os.environ["HGENCODING"] = "UTF-8"
os.environ['PYTHON_EGG_CACHE'] = '###DATADIR###/.egg-cache'

# sometimes it's needed to set the curent dir
os.chdir('###DATADIR###/')

import site
site.addsitedir("###BASEDIR###/lib/python2.7/site-packages")

from paste.deploy import loadapp
from paste.script.util.logging_config import fileConfig

fileConfig('###CONFDIR###/production.ini')
application = loadapp('config:###CONFDIR###/production.ini')
