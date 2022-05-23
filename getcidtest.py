import sys
from sys import argv
arg = argv[1] if len(argv) > 1 else input('enter consultant name: ')
import pandas as pd
import requests
data = {'query_cname': 'ALL', 'query_cid': 'ALL', 'query_zip': 'ALL', 'query_qualify':'ALL'}
proxies = {'https': None}
req = requests.post('https://prodlamp.dep.state.fl.us/www_stcm/reports/Pct_contractor/Pctc_results', data=data, proxies=proxies)
tables = pd.read_html(req.content)
df = tables[0]
print(df.to_markdown())

