from sys import argv
arg = int(argv[1] if len(argv) > 1 else input('enter FDEP no.'))
import pandas as pd
#pd.set_option('max_columns', None)
from requests import get
proxies = {'https': None}
req = get('https://prodlamp.dep.state.fl.us/www_stcm/reports/ContaminatedFacilityList', proxies=proxies)
df = pd.read_html(req.content)[0]
df = df[df['Facility ID'] == arg]
print(df[['Facility ID', 'Facility Status', 'Score', 'Score Effective Date', 'Facility Name', 'Address1', 'Address2', 'City',  'State', 'Operator', 'Phone', 'RP Name', 'RP Address1', 'RP Address2', 'RP City', 'RP State', 'Contact', 'RP Phone']].to_markdown())   
