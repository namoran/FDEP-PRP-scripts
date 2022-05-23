#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#IfWinActive SmarTerm for Windows 

WinWaitActive, SmarTerm for Windows
SplashTextOn , 100,130, PENPal Active,`nPress F1 for`nData Entry Shortcuts. ;`nPress ESC `nto exit.
WinMove, PENPal Active, , 10, 70
Sleep, 5000
SplashTextOff

Start:
while WinActive("SmarTerm for Windows")
    {
        If (A_Index < 100)
	ToolTip, F1 for Help
        Else if (A_Index < 101){
	ToolTip
	Break
	}
        Sleep, 25
    }

WinWaitNotActive, SmarTerm for Windows
SplashTextOff
ToolTip
Goto, Start
  


^+v::
Clipboardarch = %clipboard%
text = %clipboard% ;`r`n-Pasted w/ PENPal			;sets clipboard to var text and converts to plaintxt adds signature line "pasted with PENpal"

StringReplace, text, text, `r`n`r`n, `r`n, All			;finds all repeat instances of carriagereturns and line feeds and replaces with a single instance.
StringReplace, text, text, `r`n`r`n, `r`n, All			;this appears multiple times to remove instances of 3 or more carriage and line feeds this should be improved
StringReplace, text, text, `r`n`r`n, `r`n, All
StringReplace, text, text, `r`n`r`n, `r`n, All
StringReplace, text, text, `r`n`r`n, `r`n, All
StringReplace, text, text, %A_Tab%, %A_Space%, All		;this replaces all tabs with a space
StringReplace, text, text, %A_Tab%, %A_Space%, All		;this is repeated to deal with multpile tabs in a row this should be improved
StringReplace, text, text, %A_Tab%, %A_Space%, All
MsgBox, DO NOT Press Keys or Move Mouse Until Paste is Complete ;mesbox letting user know not to move mouse or keyboard   it will mess up the paste process
WinActivate, SmarTerm for Windows
while StrLen(text) > 0 						;while copied text remains in the que  continue looping
{
StringGetPos, pos, text, `r`n 					;find the first instance of a carraige return linefeed reading right from left and give a number to its position. first position is 0	
	if pos between 2 and 68						;if the location of the first CRLF is between 2 and 68 
	    {
	     StringLeft, clipboard, text, pos				;take the characters up to the CRLF and save them to the clipboard
	     StringTrimLeft, text, text, pos				;remove the characters from the var text so on the next loop it doesnt paste the same text
	     send, +{Ins}						;paste into PEN
	     sleep, 25							;sleep lets PEN process the info
	     send, {Down}						;moves down to next comment line in PEN
	     sleep, 25							;gives PEN time to process the info
	     ;MsgBox, CRLF between 2 and 68 %pos%						;debugging code uncomment to activate
	     continue							;skips to beginning of loop if this if-statement runs
	     
	    }
	else if pos between 0 and 1					;if the CRLF is in the first or second position execute the following code (look into position numbers, I think in this language the first postion is 1 instead of 0 which is unusual but may explain some bugs that have occured during the process. 
	    {
	    StringTrimLeft, text, text, 2				;trims the first 2 characters are eliminated. I think it should only need one but this so far works might need further work
	    ;MsgBox, elif executed crlf at %pos%						;debugging code uncomment to activate
	    }
	else 								;if the position of the next CRLF is further out than 68 
	    {   
	     
	     StringLeft, temp, text, 68					;take the first 68 characters of text save them to the temp var
	     StringGetPos, epos, temp, %A_Space%, R				;finds position of last space in the first 68 character chunk of text/temp	
 	     if epos = -1
	     {
		a := StrLen(temp)
		StringLeft, clipboard, text, a				;take the first 60 characters of text save them to the clipboard
	     	StringTrimLeft, text, text, a				;trim the first 60 characters of the var text so on the next loop it doesnt paste the same text
	     }
	     
	     else
	     { 
		a = %epos%
	     	StringLeft, clipboard, text, a				;take the first 60 characters of text save them to the clipboard
	     	StringTrimLeft, text, text, a+1				;trim the first 60 characters of the var text so on the next loop it doesnt paste the same text
	      }
	
	     send, +{Ins}							;Pastes into PEN
	     sleep, 25							;Waits for PEN to process
	     send, {Down}							; moves down to next comment line in PEN
	     sleep, 25							;Waits for PEN to Process
	     ;MsgBox, This else executed epos = %epos% pos = %pos%		;debugging code uncomment to activate
	     }
}

clipboard = %Clipboardarch%	
Clipboardarch = 						
MsgBox, PASTE COMPLETED. 					
return 

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;-----------------Insert Inspection into PEN--------------------------------------------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

^+i::
Setkeydelay, 100
Winclose, ahk_class AutoHotkeyGUI
Gui, New,+AlwaysOnTop
Gui, Add, Text,, Please enter the Date of inspection:
Gui, Add, DateTime, vMyDateTime, MMddyyyy
Gui, Add, Button, Default w80, OK
Gui, Show
Return

ButtonOK:
Gui, Submit
FormatTime, MyDateTime, %MyDateTime%, MMddyyyy
WinActivate, SmarTerm for Windows 
Send, Status Rev{tab}FDEP site inspection{tab}D{tab}%MyDateTime%{tab}{backspace 2}1{tab}%MyDateTime%{tab}y{tab 2}UT
Return
;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
F1::
if WinExist("HELP") 
{
	SplashTextOff
}
else
{
SplashTextOn, 330, 730,HELP,
(
Press`nCtrl+Shift+V`nto Paste in PEN 
`nCtrl+Shift+I`nto insert Inspection 
`nCtrl+Alt+C`nto insert CO 
`nCtrl+Alt+S`nto insert STATUS REV 
`nCtrl+Alt+I`nto insert INVOICE 
`nCtrl+Alt+X`nto reject with today's date 
`nCtrl+Alt+V`nto approve with today's date
`nEnsure that you're inserting your data on a blank line with the cursor at the leftmost position. If a data entry issue occurs, exit the screen by pressing F10 without saving, then go back and try again.
)
WinMove, HELP, , 10, 70
}
Return
;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------Insert CO------------------------------------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
^!c::
Winclose, ahk_class AutoHotkeyGUI
Gui, New,+AlwaysOnTop
Gui, Add, Button, Default x1 y19 w70 h30 gCOENTER, ENTER
Gui, Add, ComboBox, x71 y20 w70  vCO, CO#1|CO#2|CO#3|CO#4|CO#5|CO#6|CO#7|CO#8|CO#9|CO#10|CO#11|CO#12|CO#13|CO#14|CO#15|CO#16|CO#17|CO#18|CO#19|CO#20
GuiControl, Focus, CO
Gui, Add, CheckBox, x141 y14 w70 h30  vRevised, &Revised
Gui, Add, DateTime, x213 y19 w100 h30  vMyDateTime
Gui, Add, Radio, x315 y13 w40 h30  vTAT,&2
Gui, Add, Radio, x355 y13 w40 h30 Checked, &5
Gui, Add, Text, x3 y-1 w70 h20 , Enter CO
Gui, Add, Text, x73 y-1 w60 h20 , CO#
Gui, Add, Text, x315 y-1 w80 h20 , TAT
; Generated using SmartGUI Creator 4.0
Gui, Show, x718 y345 h54 w390, Enter CO
WinMove, Enter CO, , , 500
Return

COENTER:
Gui, Submit
If (TAT = 1) 
{
    TAT:= 2
} 
else 
{
    TAT:= 5
}
If (Revised = 0) 
{
    Revised:= ""
} 
else 
{
    Revised:= "Revised"
}
FormatTime, MyDateTime, %MyDateTime%, MMddyyyy
WinActivate, SmarTerm for Windows 
Send, {Text}VCO`t%Revised% %CO%`tD`t%MyDateTime%`t`b`b%TAT%`t`t`t`tUT
Return

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Esc:: 
Winclose, ahk_class AutoHotkeyGUI
Return

GuiEscape: 
Gui, Destroy
WinActivate, SmarTerm for Windows 
Return
;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

^!x::
; reject a status rev or CO with todays date  
FormatTime, MyDateTime, %A_Now%, MMddyyyy
WinActivate, SmarTerm for Windows 
Send, {Text}`t`t`t`t`t%MyDateTime%`tn
Return
;------------------------------------------------------------------------------------------------------------------------------------------------------------------
^!v::
;Approve a status rev or CO with today's day
FormatTime, MyDateTime, %A_Now%, MMddyyyy
WinActivate, SmarTerm for Windows 
Send, {Text}`t`t`t`t`t%MyDateTime%`ty
Return
;------------------------------------------------------------------------------------------------------------
^!s::
Winclose, ahk_class AutoHotkeyGUI
Gui, New,+AlwaysOnTop
Gui, Add, Text, x1 y4 w100 h20 , Enter StatusRev
Gui, Add, Button, x1 y24 w100 h20 gSTATUSREVENTER, ENTER
Gui, Add, Text, x241 y4 w100 h20 , Received Date
Gui, Add, DateTime, x241 y24 w100 h20 vMyDateTime, 
Gui, Add, Text, x101 y4 w140 h20 , Description
Gui, Add, Edit, x101 y24 w140 h20 -Multi Limit40 vDesc, Task 1 IAR
Gui, Add, Text, x381 y4 w30 h20 , TAT
Gui, Add, Radio, x351 y24 w30 h20 vTAT, 5
Gui, Add, Radio, x381 y24 w40 h20 Checked, 14
Gui, Add, Radio, x421 y24 w40 h20 , 30
Gui, Add, Text, x461 y4 w60 h20 , Wrk Grp
Gui, Add, ComboBox, x461 y24 w60  Limit6 vWrkGrp, UT||HWR|APR
Gui, Add, Text, x521 y4 w60 h20 , USER
Gui, Add, ComboBox, x521 y24 w60 Limit12 vUSER, BAMMAZ|CAMACD|HERMAC|RODRIRO|CASTRM|KATOCV|E317181|E317042|E317305
; Generated using SmartGUI Creator 4.0
Gui, Show, x615 y342 h56 w581, STATUS REV
GuiControl, ChooseString, USER, %USER%
GuiControl,, Desc, %Desc%
GuiControl, Focus, Desc
Return

STATUSREVENTER:
Gui, Submit
If (TAT = 1) 
{
    TAT:= 5
} 
else if (TAT = 2)
{
    TAT:= 14
}
else 
{
    TAT:= 30
} 

FormatTime, MyDateTime, %MyDateTime%, MMddyyyy
WinActivate, SmarTerm for Windows 
Send, {Text}STATUS REV`t%Desc%`tD`t%MyDateTime%`t`b`b%TAT%`t`t`t
Send, {RIGHT 7}{BS 7}%USER%
Send, {Text}`t%WrkGrp%
Return
;--------------------------------------------------------------------------------------------------------------------------------
^!i::
Winclose, ahk_class AutoHotkeyGUI
Gui, New,+AlwaysOnTop
Gui, Add, Text, x1 y4 w100 h20 , Enter Invoice
Gui, Add, Button, x1 y24 w100 h20 gINVOICEENTER, ENTER
Gui, Add, Text, x241 y4 w100 h20 , Received Date
Gui, Add, DateTime, x241 y24 w100 h20 vMyDateTime, 
Gui, Add, Text, x101 y4 w140 h20 , Description
Gui, Add, Edit, x101 y24 w140 h20 -Multi Limit40 vDesc, Task 1 IAR
Gui, Add, Text, x381 y4 w30 h20 , TAT
Gui, Add, Radio, x351 y24 w30 h20 vTAT, 5
Gui, Add, Radio, x381 y24 w40 h20 Checked, 14
Gui, Add, Radio, x421 y24 w40 h20 , 30
Gui, Add, Text, x461 y4 w60 h20 , Wrk Grp
Gui, Add, ComboBox, x461 y24 w60 Limit6 vWrkGrp, UT||HWR|APR
Gui, Add, Text, x521 y4 w60 h20 , USER
Gui, Add, ComboBox, x521 y24 w60  Limit12 vUSER, BAMMAZ|CAMACD|HERMAC|RODRIRO|CASTRM|KATOCV|E317181|E317042|E317305
; Generated using SmartGUI Creator 4.0
Gui, Show, x615 y342 h56 w581, INVOICE
GuiControl, ChooseString, USER, %USER%
GuiControl, Focus, Desc
Return

INVOICEENTER:
Gui, Submit
If (TAT = 1) 
{
    TAT:= 5
} 
else if (TAT = 2)
{
    TAT:= 14
}
else 
{
    TAT:= 30
} 

FormatTime, MyDateTime, %MyDateTime%, MMddyyyy
WinActivate, SmarTerm for Windows 
Send, {Text}INVOICE`t%Desc%`tD`t%MyDateTime%`t`b`b%TAT%`t`t`t
Send, {RIGHT 7}{BS 7}%USER%
Send, {Text}`t%WrkGrp%
Return