#! C:\WPy64-3950\python-3.9.5.amd64\python.exe
from sys import stderr
def my_input(prompt=None):
    '''this function replaces input() and prints prompt to stderr'''
    if prompt:
        stderr.write(str(prompt))
    return input()

from sys import argv
arg = argv[1] if len(argv) > 1 else my_input('enter FDEP no.')
from pandas import read_html
from requests import post
data = {'fac': arg}
proxies = {'https': None}
req = post('https://prodlamp.dep.state.fl.us/www_stcm/reports/CapToDate/Cap_to_date', data=data, proxies=proxies)
tables = read_html(req.content)
table = tables[0]

print(table.T.to_markdown())
