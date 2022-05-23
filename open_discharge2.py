from sys import argv

def getcheck_data(file):
    import subprocess
    from pathlib import Path
    import pandas as pd
    chk_file = Path(file)
    if not chk_file.exists():
        from requests import get
        proxies = {'https': None}
        req = get('https://prodlamp.dep.state.fl.us/www_stcm/reports/AllOpenDischarges', proxies=proxies)
        df = pd.read_html(req.content,index_col=[2,8])[0]
        df.to_csv(file)
        subprocess.run(["attrib","+H",str(chk_file)])
        return df #return a dataframe
    else:
        return pd.read_csv(file,index_col=["Fac ID", "Discharge Date"]) #return a dataframe
        
arg = int(argv[1] if len(argv) > 1 else input('enter FDEP no.'))

df = getcheck_data("./.discharges.csv")
while True:
    odf = df.loc[arg] #exclude nonrelevant info from other FAC IDs
    print(odf.T.to_markdown()+"\n\n")  
    arg = int(input('enter FDEP no.'))