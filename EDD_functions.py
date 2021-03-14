def check_detection(qualifier):
    '''checks to see if the analyte was detected by seeing if the qualifier is U'''
    if qualifier == 'U':
        return True
    else:
        return False

def convert_units(result, units, new_units):
    '''convert units of the results fed into the function'''
    #the units tyoes are limited to ug/l ug/kg mg/kg mg/l ppm ppb
    convert_sequence = {"ug/l":	 10**(-6),
			"ug/kg": 10**(-6),
			"ppb":	 10**(-6),
			"mg/l":  10**(-3),
			"mg/kg": 10**(-3),
			"ppm":	 10**(-3),
			"g":     10**0 
			}
    U = convert_sequence
    return result*U[units]/U[new_units], new_units

def check_GCTL_exceedance(parameter, result, units, matrix, qualifier):
    if matrix != 'W':
        return None
        pass
    
def checkSGCTL_exceedance(parameter, result, units, matrix, qualifier):
    if matrix != 'S':
        return None
        pass
