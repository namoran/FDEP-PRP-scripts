#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
DetectHiddenWindows, On
CoordMode, Caret, Screen

SetTimer, WatchCaret, 50

;MouseGetPos, VarX, VarY

ShowMainGUI:
Gui, InsertDate:New,+ToolWindow +AlwaysOnTop, Insert Date
Gui, Margin,1,1
Gui, Add, DateTime, w80 vMyDateTime gCheck, MM/dd/yyyy
Gui, Add, Button, Default w80, OK
Gui, Show, Hide, Insert Date
WinMove, Insert Date, ,%VarX%, %VarY%
Gui, Show
Return

~LButton::
Sleep, 50
if WinActive("Insert Date"){
	return
}else{
	;MouseGetPos, VarX, VarY
	WinMove, Insert Date, ,%VarX%, %VarY%
}
return

ButtonOK:
Gui, Submit
FormatTime, MyDateTime , %MyDateTime%, MM/dd/yyyy
Sleep, 50
Send, %MyDateTime%
Exitapp

Check:
FormatTime, DayofWeek , %MyDateTime%, WDay
if DayofWeek in 1,7
{
    Sleep, 500
    msgbox, , No Indy! Bad Date!, This is a weekend`nChoose another Date, 3
}
FormatTime, MyDateTime , %MyDateTime%, MM/dd/yyyy
if MyDateTime in 01/01/2019,01/21/2019,02/18/2019,05/27/2019,06/04/2019,09/02/2019,10/14/2019,11/11/2019,11/28/2019,11/29/2019,12/25/2019
{
    Sleep, 500
    msgbox, , No Indy! Bad Date!, This is a holiday`nChoose another Date, 3
}
Return

WatchCaret:
if (A_CaretX = "" AND A_CaretY = ""){
	Exit
}else{
	VarX:= A_CaretX
	VarY:= A_CaretY
	GoSub, ShowMainGUI
}
return
GuiClose:
GuiEscape:
ExitApp