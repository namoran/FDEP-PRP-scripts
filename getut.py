#! C:\WPy64-3950\python-3.9.5.amd64\python.exe
from sys import argv
import pandas as pd
from requests import get

arg = input('enter FDEP no.')


while True:
    try: 
        req = get(f'http://s0144878/DermRep/Penr/Facilities/FacilityWorkGroups.asp?FILE=&WG=UT&WGS=&WGN=&TYPE=&COI=&GEO=&CTT=&ZIP=&DEP={arg}&SIC=&EPA=&GOV=&btnSearch=Search')
        df = pd.read_html(req.content)[10]
        df = df.set_index("WG-#")
        print(df.T.to_markdown())
    except:
        print('No Entry found')
    finally:
        print("\n\n")    
        arg = input('enter FDEP no.')