#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

if WinExist("SmarTerm for Windows"){
    WinActivate
    ExitApp
    }else{
    run, C:\STWIN32\ST420NT.EXE C:\STWIN32\DRMVMS.STW
    WinWaitActive, SmarTerm for Windows
    sleep, 1000
    send, e317181
    send, {enter}
    send, Cptplanet4242
    send, {enter}
    ExitApp
    return
    }
Esc:: ExitApp
return