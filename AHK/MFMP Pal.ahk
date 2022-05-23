#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Start:
WinWaitActive, Ariba Spend Management - Internet Explorer
clipboardarch = %clipboard%
while WinActive("Ariba Spend Management - Internet Explorer")
    {
       clipboard = I, Nicholas A. Moran, certify that I am the Site Manager and the provided information is true and correct; the goods and services have been satisfactorily received and payment is now due. I understand that the office of the State Chief Financial Officer reserves the right to require additional documentation and/or conduct periodic post-audits of any agreements.
        If A_Index < 500
	ToolTip, Clipboard loaded with Cert Statement
         Else if A_Index < 501
	ToolTip
        Sleep, 10
    }
WinWaitNotActive, Ariba Spend Management - Internet Explorer
clipboard = %clipboardarch%
ToolTip
Goto, Start
