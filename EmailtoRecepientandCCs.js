/* Email Recepient and CCs */

/*This script will scan all pages of the input document
 and extract valid email addresses. the regex portion of this code was 
 found at evermap.com
 The remainder of the code was created by Nicholas Moran, PG.
*/
function ExtractFromDocument(reMatch)
{
var numWords;
	try {
		var mainrcp;
		var ccrcp = "";
		var doctext = "";
		var emailarr = [];
		var emailsig = "\n\n \
Nicholas Moran, P.G., Hydrogeologist III\n \
Environmental Assessment Section\n \
Miami-Dade County Department of Regulatory and Economic Resources\n \
Division of Environmental Resources Management (DERM)\n \
Overtown Transit Village\n \
701 NW 1st CT, 4th Floor, Miami, FL  33136-3912\n \
Phone: 305-372-6716  Fax: 305-372-6982\n \
www.miamidade.gov/environment\n \
\"Delivering Excellence Every Day\"\n \
\n \
Miami-Dade County is a public entity subject to Chapter 119 \
of the Florida Statutes concerning public records. E-mail \
messages are covered under such laws and thus subject to disclosure."
	
		for (var i = 0; i < this.numPages; i++){
			numWords = this.getPageNumWords(i);
			var PageText = "";
			console.println("pagenum: "+ (i+1));
			
			for (var j = 0; j < numWords; j++) {
				var word = this.getPageNthWord(i,j,false);
				PageText += word;
				
		
			}
			console.println("words per page: "+j);
			doctext += PageText;
		}
	//the section above creates a variable PageText for each page
	//then appends it to doctext
	// then code below searches the doctext for emails matches        
			
		var strMatches = doctext.match(reMatch);
		// now output matches into report document
		for (z = 0; z < strMatches.length; z++){
			//console.println(strMatches[z]);
			var el = strMatches[z].toLowerCase(); //Element to be searched
			var flag = 0;  // Initially 0 - Not found
			for (var l=0; l<emailarr.length; l++) {
				if (el == emailarr[l])
				flag = 1;
			}
	
		//Check if flag value changed.
			if (flag == 1){
				console.println('duplicate, not added');
			}else{
				emailarr.push(strMatches[z].toLowerCase());
			}  
		}
		mainrcp = emailarr.shift();
		ccrcp = emailarr.join("; ");
		
		console.println(ccrcp);
		console.println(mainrcp);
		console.println(emailarr);
		
		this.mailDoc({
		bUI: true,
		cTo: mainrcp,
		cCc: ccrcp,
		cSubject: "Deliverable Review Letter",
		cMsg: "Please review the attached letter and follow all instructions inside." + emailsig
		});
	}catch(e){
	app.alert("Processing error: "+e)
	}


} // end of the function


var reEmail = /(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/g;


ExtractFromDocument(reEmail);


