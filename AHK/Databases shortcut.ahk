#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SetNumLockState, AlwaysOn
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, Tray, Add, Ctrl+F4 Load PEN, ^F4
Menu, Tray, Add, Ctrl+F5 Load STCM, ^F5
Menu, Tray, Add, Ctrl+F6 Load MFMP, ^F6
Menu, Tray, Add, Ctrl+F7 Load ECM, ^F7
Menu, Tray, Add, Ctrl+F8 Load Oculus, ^F8
Menu, Tray, Add, Ctrl+F9 Backlog, ^F9

;-----------------Always on top---------------------------
^SPACE::  Winset, Alwaysontop, , A

:*:[[d::  ; This hotstring replaces "[[d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, MM-dd-yyyy  ; It will look like 09-01-2005
SendInput %CurrentDateTime%
return

:*:[[fd::  ; This hotstring replaces "[[fd" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, yyyy-MM-dd  ; It will look like 2005-09-01
SendInput %CurrentDateTime%
return
;-----------------alttabfor lefties---------------------------
RControl & PgDn::AltTab  ; Hold down right-control then press pagedown repeatedly to move forward.
RControl & End::ShiftAltTab  ; Without even having to release right-control, press End to reverse direction.
RControl & PgUp::#Tab

;-----------------cutcopypaste for lefties---------------------------
RControl & Enter::^c  ; Copy
RControl & \::^v      ; Paste
RControl & Rshift::^x ; Cut
RControl & ?::^a ; select all
;-----------------LaunchDatabases---------------------------

~Scrolllock:: Suspend
^F4::
run, Load PEN.ahk
return
^F5::
run, Load STCM.ahk
return
^F6::
run, Load MFMP.ahk
return
^F7::
run, load ECM.ahk
return
^F8::
run, Load Oculus.ahk
return
^F9::
run, Backlog.ahk
return
;----Remove Pluses in downloads----------------------------------------------------------------
;^+p::
;send, ^c
;sleep 50
;StringReplace, clipboard, clipboard,Schedule of Pay Items & Other Related Documents,SPI, All
;StringReplace, clipboard, clipboard,Schedule+of+Pay+Items+&+Other+Related+Documents,SPI, All
;StringReplace, clipboard, clipboard, +,, All
;StringReplace, clipboard, clipboard, %A_Space%,, All
;send, ^v
;return

