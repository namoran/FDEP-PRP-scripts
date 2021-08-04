GCTLs = {'benzene':1,
         'acetone':6300,
         'acenaphthene':20,
         'acenaphthylene':210,
         'anthracene':2100,
         'benzo(a)anthracene':0.05,
         'benzo(a)pyrene':0.2,
         'benzo(b)fluoranthene':0.05,
         'benzo(g,h,i)perylene':210,
         'benzo(k)fluoranthene': 0.5,
         'chrysene':4.8,
         'dibenzo(a,h)anthracene':0.005,
         'dibromochloromethane':0.4,
         'fluoranthene':280,
         'fluorene':280,
         'indeno(1,2,3-cd)pyrene':0.05,
         'isopropylbenzene':0.8,
         'cumene':0.8,
         '1-methylnaphthalene':28,
         '1-methylnaphthalene':28,
         '2-methylnaphthalene':28,
         'naphthalene':14,
         'phenanthrene':210,
         'pyrene':210,
         'ethylbenzene':30,
         'toluene':40,
         'xylenes, total':20,
         'xylenes- total':20,
         'dibromoethane, 1,2-':0.02,
         'edb':0.02,
         'dichloroethane, 1,2-':3,
         'mtbe':20,
         'methyl-t-butyl ether':20,
         'trphs':5000,
         'total recoverable pet. hydrocarbons':5000,
         'arsenic':10,
         'cadmium':5,
         'chromium (total)':100,
         'lead':15}

NADCs = {'benzene':100,
         'acenaphthene':200,
         'acenaphthylene':2100,
         'anthracene':21000,
         'benzo(a)anthracene':5, 
         'benzo(a)pyrene':20,
         'benzo(b)fluoranthene':5,
         'benzo(g,h,i)perylene':2100,
         'benzo(k)fluoranthene': 50, 
         'chrysene':480,
         'dibenzo(a,h)anthracene':0.5,
         'fluoranthene':2800,
         'fluorene':2800,
         'indeno(1,2,3-cd)pyrene':5,
         'isopropylbenzene':8,
         'cumene':8,
         '1-methylnaphthalene':280,
         '1-methylnaphthalene':280,
         '2-methylnaphthalene':280,
         'naphthalene':140,
         'phenanthrene':2100,
         'pyrene':2100, 
         'ethylbenzene':300,
         'toluene':400,
         'xylenes, total':200,
         'xylenes- total':200,
         'dibromoethane, 1,2-':2,
         'edb':2,
         'dichloroethane, 1,2-':300, 
         'mtbe':200,
         'methyl-t-butyl ether':200,
         'trphs':50000,
         'total recoverable pet. hydrocarbons':50000,
         'arsenic':100,
         'cadmium':50,
         'chromium (total)':1000,
         'lead':150}

SCTLs = {'acenapthene':2400000,
         'acenaphthylene':1800000,
         'anthracene':21000000,
         'benzo(b)anthracene': None,
         'benzo(a)pyrene':100,
         'benzo(b)fluoranthene':None,
         'benzo(g,h,i)perylene':2500000,
         'benzo(k)fluoranthene':None,
         'chrysene':None,
         'dibenzo(a,h)anthracene':None,
         'fluoranthene':3200000,
         'fluorene':2600000,
         'indeno(1,2,3-cd)pyrene':None,
         '1-methylnaphthalene':200000,
         '2-methylnaphthalene':210000,
         'naphthalene':55000,
         'phenanthrene':2200000,
         'pyrene':2400000,
         'benzene':1200,
         'ethylbenzene':1500000,
         'toluene':7500000,
         'total xylenes':130000,
         '1,2-dichloroethane':500,
         'mtbe':4400000,
         'methyl-t-butyl ether':4400000,
         'trph':460000,
         'arsenic':2100,
         'cadmium':82000,
         'chromium':210,
         'lead':400000}

Leachabilities = {'acenapthene':2.1,
         'acenaphthylene':27,
         'anthracene':2500,
         'benzo(a)anthracene': .8,
         'benzo(a)pyrene':8,
         'benzo(b)fluoranthene':2.4,
         'benzo(g,h,i)perylene':32000,
         'benzo(k)fluoranthene':24,
         'chrysene':77,
         'dibenzo(a,h)anthracene':.7,
         'fluoranthene':1200,
         'fluorene':160,
         'indeno(1,2,3-cd)pyrene':6.6,
         '1-methylnaphthalene':3.1,
         '2-methylnaphthalene':8.5,
         'naphthalene':1.2,
         'phenanthrene':250,
         'pyrene':880,
         'benzene':.007,
         'ethylbenzene':.6,
         'toluene':.5,
         'total xylenes':.2,
         '1,2-dichloroethane':0.01,
         'mtbe':.090,
         'methyl-t-butyl ether':.090,
         'trph':340,
         'arsenic':2.1,
         'cadmium':7.5,
         'chromium':38,
         'lead':400}

import csv
import sys
from operator import itemgetter
import os
#os.system("mode con: cols=220")
import fileinput
try:
        from GTCLdictcleaned import GCTLs
        print('import of expanded gctls successful')
except:
        print('import of expanded gctl dictionary did not work')

try:
        from Leachability import Leachability as Leachabilities
        print('import of expanded leachability successful')        
except:
        print('import of expanded leachability dictionary did not work')

try:
        from DERCTLs import DERCTLs as SCTLs
        print('import of expanded sctls successful')
except:
        print('import of expanded sctl dictionary did not work')
        
HitSummary = []
GCTLSummary = []
NADCSummary = []
LeachabilitySummary = []
SCTLSummary = []
DetectionSummary = []
EDD = []


def display_table(list):
        
        sortedlist = sorted(list,key=itemgetter('ANALYTPARAM'))
        sortedlist = sorted(sortedlist,key=itemgetter('SAMPLOC'))
        for count, row in enumerate(sortedlist):
                GCTL=NADC=GCTL_Exceedance=NADC_Exceedance=Leachability_exceedance=SCTL_Exceedance=Detection=SCTL=Leachability=''
                                
                if row['ANALYTPARAM'] in ['SAMPLE DEPTH','Dissolved Oxygen', 'Specific Conductance', 'Temperature, Water', 'Turbidity', 'pH']:
                        continue
                if row['QAQUAL']!= 'U':
                        Detection = 'Detection'
                else:
                        Detection = ''
                   
                
                
                if count == 0:
                    print("{:15}{:<25}{:<30}{:<45}{:>12}{:^10}{:<15}{:^15}{:^15}{:^25}{:^25}{:^25}".format \
              ('Fac_ID','Loc_Name', 'Samp_Date','Param','R','Q',\
               'U', 'GCTL ug/L', 'NADC ug/L', 'Dtd', 'GCTL Ex', 'NADC Ex'))
                if GCTLs.get(row['ANALYTPARAM'].lower()) != None:         # if a GCTL is in the GCTL list set its value to the var GCTL
                        GCTL = GCTLs.get(row['ANALYTPARAM'].lower())
                else:                                                   # if a GCTL is not in the list then the GCTL variable is made blank
                        GCTL = ''
                if NADCs.get(row['ANALYTPARAM'].lower()) != None:         # if a NADC is not in the list then set ths value to the var NADC
                        NADC = NADCs.get(row['ANALYTPARAM'].lower())      
                else:
                        NADC = ''                                       # if a NADC is not in the list then the NADC variable is made blank
                if   GCTLs.get(row['ANALYTPARAM'].lower()) != None:        
                        if   row['CONCUNITS'].lower() == 'ugl' and float(row['CONC']) > float(GCTLs.get(row['ANALYTPARAM'].lower())):
                                GCTL_Exceedance = 'GCTL_Exceedance'
                              
                                
                        elif row['CONCUNITS'].lower() == 'mgl' and float(row['CONC'])*1000 > float(GCTLs.get(row['ANALYTPARAM'].lower())):
                                GCTL_Exceedance = 'GCTL_Exceedance'
                               
                        else:
                                GCTL_Exceedance = ''
                

                        
                if   NADCs.get(row['ANALYTPARAM'].lower()) != None:
                        if    row['CONCUNITS'].lower() == 'ugl' and float(row['CONC']) > float(NADCs.get(row['ANALYTPARAM'].lower())):
                                NADC_Exceedance = 'NADC_Exceedance'
                               
                                
                        elif  row['CONCUNITS'].lower() == 'mgl' and float(row['CONC'])*1000 > float(NADCs.get(row['ANALYTPARAM'].lower())):
                                NADC_Exceedance = 'NADC_Exceedance'
                                
                        else:
                                NADC_Exceedance = ''
                #print(EDD)
                print("{:15}{:<25}{:<30}{:<45}{:>12}{:^10}{:<15}{:^15}{:^15}{:^25}{:^25}{:^25}".format \
                  (row['SITEID'],row['SAMPLOC'], row['SampDate'], row['ANALYTPARAM'], row['CONC'], row['QAQUAL'],\
                   row['CONCUNITS'], GCTL, NADC, Detection, GCTL_Exceedance, NADC_Exceedance))        

#os.system("mode con: cols=220")
with fileinput.input(sys.argv[1:]) as fileset:
	reader = csv.DictReader(fileset)
	for count, row in enumerate(reader):
                EDD.append(row)
                
                if row['QAQUAL']!= 'U':
                        Detection = 'Detection'
                        DetectionSummary.append(row)
                else:
                        Detection = ''

                        
                
                if   GCTLs.get(row['ANALYTPARAM'].lower()) != None:        
                        if   row['CONCUNITS'].lower() == 'ugl' and float(row['CONC']) > float(GCTLs.get(row['ANALYTPARAM'].lower())):
                                if row not in HitSummary and row['QAQUAL'] != 'U':
                                        HitSummary.append(row)
                                GCTLSummary.append(row)
                                
                        elif row['CONCUNITS'].lower() == 'mgl' and float(row['CONC'])*1000 > float(GCTLs.get(row['ANALYTPARAM'].lower())):
                                if row not in HitSummary and row['QAQUAL'] != 'U':
                                        HitSummary.append(row)
                                GCTLSummary.append(row)
                if   NADCs.get(row['ANALYTPARAM'].lower()) != None:
                        if    row['CONCUNITS'].lower() == 'ugl' and float(row['CONC']) > float(NADCs.get(row['ANALYTPARAM'].lower())):
                                upper_Exceedance = 'NADC_Exceedance'
                                if row not in HitSummary and row['QAQUAL'] != 'U':
                                        HitSummary.append(row)
                                NADCSummary.append(row)
                                if row in GCTLSummary:
                                        GCTLSummary.pop()
                                        
                        elif  row['CONCUNITS'].lower() == 'mgl' and float(row['CONC'])*1000 > float(NADCs.get(row['ANALYTPARAM'].lower())):
                               
                                if row not in HitSummary and row['QAQUAL'] != 'U':
                                        HitSummary.append(row)
                                NADCSummary.append(row)
                                if row in GCTLSummary:
                                        GCTLSummary.pop()
                                 

print(" HitSummary ".center(255,"*"))
print('')
display_table(HitSummary)
print('')
print('')
print(' GCTL_Exceedances '.center(255,'*'))
print('')
display_table(GCTLSummary)
print('')
print('')
print(' NADC_Exceedance '.center(255,'*'))
print('')
display_table(NADCSummary)
print('')
print('')
print(' SCTLSummary '.center(255,'*'))
print('')
display_table(SCTLSummary)
print('')
print('')
print(' LeachabilitySummary '.center(255,'*'))
print('')
display_table(LeachabilitySummary)
print('')
print('')
print(' DetectionSummary '.center(255,'*'))
print('')
display_table(DetectionSummary)
print('')
print('')

input('Press Enter to close')

	
