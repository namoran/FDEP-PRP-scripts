from decimal import Decimal

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

def check_detection(qualifier):
    '''checks to see if the analyte was detected by seeing if the qualifier is U'''
    if qualifier == 'U':
        return True
    else:
        return False

def convert_units(result, units, new_units):
    '''convert units of the results fed into the function'''
    #the units tyoes are limited to ug/l ug/kg mg/kg mg/l ppm ppb
    convert_sequence = {"u":	 Decimal('10e-6'),
			"ppb":	 Decimal('10e-6'),
			"m": 	 Decimal('10e-3'),
			"ppm":	 Decimal('10e-3'),
			}
    result = Decimal(str(result))
    U = convert_sequence
    if units in {"ppb", "ppm"} and new_units in {"ppb", "ppm"}:
        return result*U[units]/U[new_units], new_units
    if units in {"ppb", "ppm"}:
        return result*U[units]/U[new_units[0]], new_units
    if new_units in {"ppb", "ppm"}:
        return result*U[units[0]]/U[new_units], new_units
    if units[-1] == new_units[-1]:
        return result*U[units[0]]/U[new_units[0]], new_units
    
def check_GCTL_exceedance(parameter, result, units, matrix, qualifier):
    if matrix != 'W':
        return None
        pass
    
def checkSGCTL_exceedance(parameter, result, units, matrix, qualifier):
    if matrix != 'S':
        return None
        pass

def import_edds():
    import fileinput
    import sys
    import csv
    EDDs = []  
    with fileinput.input(sys.argv[1:]) as fileset:
        reader = csv.reader(fileset)
        for count, row in enumerate(reader):
            if count < 1:
                continue
            elif count == 1:
                fieldnames = row
                print(fieldnames)
                break
        reader = csv.DictReader(fileset,fieldnames=fieldnames)
        for count, row in enumerate(reader):
                    if fileinput.filelineno() == 1 or fileinput.filelineno() == 2:
                            continue
                    EDDs.append(row)
    return EDDs

def validate_edds():
    pass

def import_and_sort_edds():
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
        
    import fileinput
    import sys
    import csv
    HitSummary = []
    GCTLSummary = []
    NADCSummary = []
    LeachabilitySummary = []
    SCTLSummary = []
    DetectionSummary = []
    EDDs = []
    with fileinput.input(sys.argv[1:]) as fileset:
        reader = csv.reader(fileset)
        for count, row in enumerate(reader):
            if count < 1:
                continue
            elif count == 1:
                fieldnames = row
                print(fieldnames)
                break
        reader = csv.DictReader(fileset,fieldnames=fieldnames) # this does not start "fileset" on the 0 line but on the 2, thus the code if fileinput.filelineno() == 1 or fileinput.filelineno() == 2: appears useless
        for count, row in enumerate(reader):                                      
                    if fileinput.filelineno() == 1 or fileinput.filelineno() == 2: # this section fo the code doesnt appear to ever be triggered beciase the fileinput.fileno does not return to zero becuase "fileset" is not "seeked" to the beggining of the file object
                            continue
                    EDDs.append(row)
                    
                    if row['Qualifier']!= 'U':
                            Detection = 'Detection'
                            DetectionSummary.append(row)
                    else:
                            Detection = ''

                            
                    if row['Matrix'] == 'W':        # Everything within this if is for water samples
                            if   GCTLs.get(row['Parameter'].lower()) != None:        
                                    if   row['Units'].lower() == 'ug/l' and float(row['Result']) > float(GCTLs.get(row['Parameter'].lower())):
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            GCTLSummary.append(row)
                                            
                                    elif row['Units'].lower() == 'mg/l' and float(row['Result'])*1000 > float(GCTLs.get(row['Parameter'].lower())):
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            GCTLSummary.append(row)
                            if   NADCs.get(row['Parameter'].lower()) != None:
                                    if    row['Units'].lower() == 'ug/l' and float(row['Result']) > float(NADCs.get(row['Parameter'].lower())):
                                            upper_Exceedance = 'NADC_Exceedance'
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            NADCSummary.append(row)
                                            if row in GCTLSummary:
                                                    GCTLSummary.pop()
                                                    
                                    elif  row['Units'].lower() == 'mg/l' and float(row['Result'])*1000 > float(NADCs.get(row['Parameter'].lower())):
                                            
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            NADCSummary.append(row)
                                            if row in GCTLSummary:
                                                    GCTLSummary.pop()
                                                
                    elif row['Matrix'] == 'S':      # Everyting within this if is for soil samples
                            if   Leachabilities.get(row['Parameter'].lower()) != None:        
                                    if   row['Units'].lower() == 'ug/kg' and float(row['Result'])/1000 > float(Leachabilities.get(row['Parameter'].lower())):
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            LeachabilitySummary.append(row)
                                            
                                    elif row['Units'].lower() == 'mg/kg' and float(row['Result']) > float(Leachabilities.get(row['Parameter'].lower())):
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            LeachabilitySummary.append(row)
                            if   SCTLs.get(row['Parameter'].lower()) != None:
                                    if    row['Units'].lower() == 'ug/kg' and float(row['Result'])/1000 > float(SCTLs.get(row['Parameter'].lower())):
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            SCTLSummary.append(row)
                                            if row in LeachabilitySummary:
                                                    LeachabilitySummary.pop()
                                                    
                                    elif  row['Units'].lower() == 'mg/kg' and float(row['Result']) > float(SCTLs.get(row['Parameter'].lower())):
                                            if row not in HitSummary and row['Qualifier'] != 'U':
                                                    HitSummary.append(row)
                                            SCTLSummary.append(row)
                                            if row in LeachabilitySummary:
                                                    LeachabilitySummary.pop()

                    else:                           # This is for anything that isnt S or W, it gets skipped over silently
                            continue  