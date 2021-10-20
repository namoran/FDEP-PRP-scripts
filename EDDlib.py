def getedd(filenames):
    import csv
    import sys
    import fileinput
    EDD = []
    with fileinput.input(filenames) as fileset:
        reader = csv.reader(fileset)
        for count, row in enumerate(reader):
            if count < 1:
                continue
            elif count == 1:
                fieldnames = row
                #print(fieldnames)
                break
        reader = csv.DictReader(fileset,fieldnames=fieldnames)
        for count, row in enumerate(reader):
                    if fileinput.filelineno() == 1 or fileinput.filelineno() == 2:
                            #continue
                            print("This row was skipped: ",row)
                    EDD.append(row)
                    
    return EDD                