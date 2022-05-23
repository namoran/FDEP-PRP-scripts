#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
CoordMode, Mouse , Screen

MouseGetPos, VarX, VarY
Gui, New
Gui, Add, DateTime, vMyDateTime, MM/dd/yyyy
Gui, Add, Button, Default w80, OK
Gui, Show, , Insert Date
WinMove, Insert Date, ,%VarX%, %VarY%
Return

ButtonOK:
Gui, Submit
FormatTime, MyDateTime , %MyDateTime%, MMddyyyy
Send, %MyDateTime%
Exitapp

GuiClose:
GuiEscape:
ExitApp