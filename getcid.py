import sys
import pandas as pd
import requests
data = {'query_cname': f'{sys.argv[1]}', 'query_cid': 'ALL', 'query_zip': 'ALL', 'query_qualify':'ALL'}
proxies = {'https': None}
req = requests.post('https://prodlamp.dep.state.fl.us/www_stcm/reports/Pct_contractor/Pctc_results', data=data, proxies=proxies)
tables = pd.read_html(req.content)
print(tables[0].to_markdown())

