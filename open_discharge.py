from sys import argv
arg = int(argv[1] if len(argv) > 1 else input('enter FDEP no.'))
import pandas as pd
#pd.set_option('max_columns', None)
from requests import get
proxies = {'https': None}
req = get('https://prodlamp.dep.state.fl.us/www_stcm/reports/AllOpenDischarges', proxies=proxies)
df = pd.read_html(req.content)[0]
df = df[df['Fac ID'] == arg] #exclude nonrelevant info from other FAC IDs
print(df.to_markdown())   
