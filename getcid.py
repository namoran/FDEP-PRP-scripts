#! C:\WPy64-3950\python-3.9.5.amd64\python.exe
import sys
from sys import argv
arg = argv[1] if len(argv) > 1 else input('enter consultant name: ')
import pandas as pd
import requests
data = {'query_cname': f'{arg}', 'query_cid': 'ALL', 'query_zip': 'ALL', 'query_qualify':'ALL'}
proxies = {'https': None}
req = requests.post('https://prodlamp.dep.state.fl.us/www_stcm/reports/Pct_contractor/Pctc_results', data=data, proxies=proxies)
tables = pd.read_html(req.content)
print(tables[0].to_markdown())

