#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;-----------------------------------------------------------------------------------------LaunchDatabases--------------------------------------------------------------------------------------------------------------------
~Scrolllock:: Suspend
F4::
run, Load PEN.ahk
return
F5::
run, Load STCM.ahk
return
F6::
run, Load MFMP.ahk
return
F7::
run, load ECM.ahk
return
F8::
run, Load Oculus.ahk
return

