from tabulate import tabulate
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
data = {'fac': arg, 'query_fac': arg, 'excel_output': 'N'}
proxies = {'https': None}
req = post('https://prodlamp.dep.state.fl.us/www_stcm/reports/DeliStatus/deli', data=data, proxies=proxies)
tables = read_html(req.content)
print(tabulate(tables[0].astype(object).fillna(""), headers="keys", showindex=False, tablefmt="fancy_grid"))
