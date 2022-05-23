#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 100

^+i::
Gui, New
Gui, Add, Text,, Please enter the Date of inspection:
Gui, Add, DateTime, vMyDateTime, MMddyyyy
Gui, Add, Button, Default w80, OK
Gui, Show
Return

ButtonOK:
Gui, Submit
FormatTime, MyDateTime, %MyDateTime%, MMddyyyy
WinActivate, New Text Document.txt 
Send, {Text}Status Rev{tab}FDEP site inspection{tab}D{tab}%MyDateTime%{tab}{backspace 2}1{tab}%MyDateTime%{tab}y{tab 2}UT