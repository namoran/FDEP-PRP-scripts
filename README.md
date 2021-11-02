This repo is a grouping of several scripts that I use for work on the petroleum restoration program. There is a draft EDD evaluation script that is mostly completed, but it needs tests to be created and the code needs to be refactored to be more functional.

Getcid.py
---------
This script should be run from the commandline. It takes a name of a consultant as a its input and returns a markdown table to the console. 
It can be called either by itself with no argument, in which case the script will request input from the user, or you can provide the script with the name of the consultant as an argument. The name doesnt have to be complete, for example, searching for MAS will return MAS the information for MAS environmental LLC.

open_discharge.py
------------------
This script should be run from the commandline. It takes a FDEP number as a its input and returns a markdown table to the console. 
It can be called either by itself with no argument, in which case the script will request input from the user, or you can provide the script with the fdep facility number of interest (a 7 digit number often starting with 850.... but not always)

captable.py
------------
This script works similary to the one above, it takes the FDEP ID number as input and returns the cap to date information in a markdown table. This script should be run from the command line and can be run with an argument or it can be run without an argument in which case the script will prompt the user for the FDEP fac ID number. 

contam.py
---------
This script works similarly to the ones above, it takes an FDEP ID as an input and returns the contaminated facility data (if the facility is on the contaminated facility list) to the console in a markdown table. 
