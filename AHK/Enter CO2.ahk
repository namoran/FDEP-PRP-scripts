#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 100

Gui, Add, Button, x1 y19 w70 h30 , ENTER
Gui, Add, ComboBox, x71 y20 w70 h24  vCO, CO#1|CO#2|CO#3|CO#4|CO#5|CO#6|CO#7|CO#8|CO#9|CO#10
Gui, Add, CheckBox, x141 y14 w70 h30  vRevised, Revised
Gui, Add, DateTime, x213 y19 w100 h30  vMyDateTime
Gui, Add, Radio, x315 y13 w40 h30  vTAT,2
Gui, Add, Radio, x355 y13 w40 h30 Checked, 5
Gui, Add, Text, x3 y-1 w70 h20 , Enter CO
Gui, Add, Text, x73 y-1 w60 h20 , CO#
Gui, Add, Text, x315 y-1 w80 h20 , TAT
; Generated using SmartGUI Creator 4.0
Gui, Show, x718 y345 h54 w390, New GUI Window
Return

ButtonENTER:
Gui, Submit, NoHide
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
WinActivate, New Text Document.txt 
Send, {Text}VCO`t%Revised%%CO%`tD`t%MyDateTime%`t`b`b%TAT%`t`t`t`tUT
Return
