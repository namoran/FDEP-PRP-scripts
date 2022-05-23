#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

run, C:\STWIN32\ST420NT.EXE C:\STWIN32\DRMVMS.STW
sleep, 5000
send, e317181
send, {enter}
send, Cptplanet1818
send, {enter}
ExitApp
return
Esc:: ExitApp
return