#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive SmarTerm for Windows

Start:
WinWaitActive, SmarTerm for Windows
SplashTextOn , 100,130, PENPal Active,Press `nCtrl+Shift+V `nto Paste `nin PEN. `nPress ESC `nto exit.
WinMove, PENPal Active, , 10, 70

WinWaitNotActive, SmarTerm for Windows
SplashTextOff
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


;Esc:: ExitApp								;adds an escape function kill the app at anytime by pressing esc
;return
