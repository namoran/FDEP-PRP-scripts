def check_detection(qualifier):
    '''checks to see if the analyte was detected by seeing if the qualifier is U'''
        if qualifer = 'U':
                return True
        else:
                return False

def convert_units(result, units, new_units):
    '''convert units of the results fed into the fuction'''
    #the units tyoes are limited to ug/l ug/kg mg/kg mg/l ppm ppb
    if units == new_units:
        return result, units
    return converted_result, new_units

def check_GCTL_exceedance(parameter, result, units, matrix, qualifier):
    if matrix != 'W':
        return None
        pass
    
def checkSGCTL_exceedance(parameter, result, units, matrix, qualifier):
    if matrix != 'S':
        return None
        pass
