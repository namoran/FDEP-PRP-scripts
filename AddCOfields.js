/* Add CO Fields */
var rCrop = this.getPageBox("Crop",this.pageNum);
var inch = 72;

//UT Label
var aRectutLabel=[];
aRectutLabel[0]= 0.80*rCrop[2]; //left side of text input
aRectutLabel[2]= aRectutLabel[0]+0.35*inch; // calculate width
aRectutLabel[1]= 0.999*rCrop[1]; // top of the field
aRectutLabel[3]= aRectutLabel[1]-0.18*inch; //field height
var utnoLabel = this.addField("UTLabel", "text", this.pageNum, aRectutLabel);
//utnoLabel.delay = true;
utnoLabel.value = "UT#:";
utnoLabel.readonly = true;
utnoLabel.textSize = 0; //autosize
utnoLabel.alignment = "right";
utnoLabel.textFont = font.HelvB;
//utnoLabel.delay = false;

//UT no
var aRectut=[];
aRectut[0] = aRectutLabel[2] + 0.8; //left side of text input
aRectut[2] = aRectut[0]+0.45*inch; // calculate width
aRectut[1] = aRectutLabel[1];
aRectut[3] = aRectut[1] -0.18*inch;
var utno = this.addField("UT#", "text", this.pageNum, aRectut);
//utno.delay = true;
utno.textSize = 0; //autosize
utno.alignment = "left";
utno.textFont = font.HelvB;
//utno.delay = false;

//PrgLabel
var aRectprgLabel=[];
aRectprgLabel[0]= aRectutLabel[0]; //left side of text input
aRectprgLabel[2]= aRectutLabel[2]; // calculate width
aRectprgLabel[1]= aRectutLabel[3] -0.8;
aRectprgLabel[3]= aRectprgLabel[1] -0.18*inch;
var prgLabel = this.addField("PrgLabel", "text", this.pageNum, aRectprgLabel);
//prgLabel.delay = true;
prgLabel.value = "Prg:";
prgLabel.readonly = true;
prgLabel.textSize = 0; //autosize
prgLabel.alignment = "right";
prgLabel.textFont = font.HelvB;
//prgLabel.delay = false;

//Prg
var aRectprg=[];
aRectprg[0] = aRectprgLabel[2] + 0.8; //left side of text input
aRectprg[2] = aRectprg[0]+0.45*inch;// calculate width
aRectprg[1] = aRectprgLabel[1];
aRectprg[3] = aRectprg[1]-0.18*inch;
var prg = this.addField("prg", "text", this.pageNum, aRectprg);
prg.textSize = 0; //autosize
prg.defaultValue = "Prg: ";
prg.alignment = "left";
prg.textFont = font.HelvB;


//Scr Label
var aRectscrLabel=[];
aRectscrLabel[0]= aRectprgLabel[0]; //align label with the label above
aRectscrLabel[2]= aRectprgLabel[2]; // 
aRectscrLabel[1]= aRectprgLabel[3] - 0.8;
aRectscrLabel[3]= aRectscrLabel[1]-0.18*inch;
var scrLabel = this.addField("scrLabel", "text", this.pageNum, aRectscrLabel);
//scrLabel.delay = true;
scrLabel.value = "Scr:";
scrLabel.readonly = true;
scrLabel.textSize = 0; //autosize
scrLabel.alignment = "right";
scrLabel.textFont = font.HelvB;
//scrLabel.delay = false;

//Scr
var aRectscr=[];
aRectscr[0] = aRectscrLabel[2] + 0.8; //left side of text input
aRectscr[2] = aRectscr[0]+0.45*inch;// calculate width
aRectscr[1] = aRectscrLabel[1];
aRectscr[3] = aRectscr[1]-0.18*inch;
var scr = this.addField("scr", "text", this.pageNum, aRectscr);
scr.textSize = 0; //autosize
scr.defaultValue = "Scr: ";
scr.alignment = "left";
scr.textFont = font.HelvB;

//PO Start Label
var aRectpoLabel=[];
aRectpoLabel[0]= aRectscrLabel[0]-20; //align label with the label above, then expand 20 points to the left
aRectpoLabel[2]= aRectscrLabel[2]; // 
aRectpoLabel[1]= aRectscrLabel[3] - 0.8;
aRectpoLabel[3]= aRectpoLabel[1]-0.18*inch;
var poLabel = this.addField("poLabel", "text", this.pageNum, aRectpoLabel);
//poLabel.delay = true;
poLabel.value = "PO Start: ";
poLabel.readonly = true;
poLabel.textSize = 0; //autosize
poLabel.alignment = "right";
poLabel.textFont = font.HelvB;
//poLabel.delay = false;

//POStart
var aRectpo=[];
aRectpo[0] = aRectpoLabel[2] + 0.8; //left side of text input
aRectpo[2] = aRectpo[0]+0.75*inch;// calculate width
aRectpo[1] = aRectpoLabel[1];
aRectpo[3] = aRectpo[1]-0.22*inch;
var po = this.addField("POStart", "text", this.pageNum, aRectpo);
po.textSize = 0; //autosize
po.defaultValue = "mm/dd/yyyy";
po.alignment = "left";
po.textFont = font.HelvB;

//PEN Label
var aRectPENLabel=[];
aRectPENLabel[0]= aRectut[2]; //place this at the right end of the UT# field
aRectPENLabel[2]= aRectPENLabel[0]+0.35*inch; // calculate width
aRectPENLabel[1]= aRectut[1]; // top of the field, align with the UT# field
aRectPENLabel[3]= aRectPENLabel[1]-0.18*inch; //field height
var PENLabel = this.addField("PENLabel", "text", this.pageNum, aRectPENLabel);
//PENLabel.delay = true;
PENLabel.value = "PEN";
PENLabel.readonly = true;
PENLabel.textSize = 0; //autosize
PENLabel.alignment = "right";
PENLabel.textFont = font.HelvB;
//PENLabel.delay = false;

//PEN Check
var aRectPEN=[];
aRectPEN[0] = aRectPENLabel[2] + 0.8; //left side of text input
aRectPEN[2] = aRectPEN[0]+0.18*inch; // calculate width
aRectPEN[1] = aRectPENLabel[1];
aRectPEN[3] = aRectPEN[1] -0.18*inch;
var PEN = this.addField("PEN", "checkbox", this.pageNum, aRectPEN);
//PEN.delay = true;
PEN.style = style.ch;
//PEN.delay = false;

//STCM Label
var aRectSTCMLabel=[];
aRectSTCMLabel[0]= aRectPENLabel[0]; //align this with the label field above
aRectSTCMLabel[2]= aRectSTCMLabel[0]+0.35*inch; // calculate width
aRectSTCMLabel[1]= aRectPENLabel[3]-0.8; // top of the field, place just below the PEN Label with 0.8 points of space between
aRectSTCMLabel[3]= aRectSTCMLabel[1]-0.18*inch; //field height
var STCMLabel = this.addField("STCMLabel", "text", this.pageNum, aRectSTCMLabel);
//STCMLabel.delay = true;
STCMLabel.value = "STCM";
STCMLabel.readonly = true;
STCMLabel.textSize = 0; //autosize
STCMLabel.alignment = "right";
STCMLabel.textFont = font.HelvB;
//STCMLabel.delay = false;

//STCM Check
var aRectSTCM=[];
aRectSTCM[0] = aRectSTCMLabel[2] + 0.8; //left side of text input
aRectSTCM[2] = aRectSTCM[0]+0.18*inch; // calculate width
aRectSTCM[1] = aRectSTCMLabel[1];
aRectSTCM[3] = aRectSTCM[1] -0.18*inch;
var STCM = this.addField("STCM", "checkbox", this.pageNum, aRectSTCM);
//STCM.delay = true;
STCM.style = style.ch;
//STCM.delay = false;

//SPI Label
var aRectSPILabel=[];
aRectSPILabel[0]= aRectSTCMLabel[0]; //align this with the label field above
aRectSPILabel[2]= aRectSPILabel[0]+0.35*inch; // calculate width
aRectSPILabel[1]= aRectSTCMLabel[3]-0.8; // top of the field, place just below the STCM Label with 0.8 points of space between
aRectSPILabel[3]= aRectSPILabel[1]-0.18*inch; //field height
var SPILabel = this.addField("SPILabel", "text", this.pageNum, aRectSPILabel);
//SPILabel.delay = true;
SPILabel.value = "SPI";
SPILabel.readonly = true;
SPILabel.textSize = 0; //autosize
SPILabel.alignment = "right";
SPILabel.textFont = font.HelvB;
//SPILabel.delay = false;

//SPI Check
var aRectSPI=[];
aRectSPI[0] = aRectSPILabel[2] + 0.8; //left side of text input
aRectSPI[2] = aRectSPI[0]+0.18*inch; // calculate width
aRectSPI[1] = aRectSPILabel[1];
aRectSPI[3] = aRectSPI[1] -0.18*inch;
var SPI = this.addField("SPI", "checkbox", this.pageNum, aRectSPI);
//STCM.delay = true;
SPI.style = style.ch;
//STCM.delay = false;

