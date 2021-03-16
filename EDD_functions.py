from decimal import Decimal

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
