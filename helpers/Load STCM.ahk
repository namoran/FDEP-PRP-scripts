#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3


wb := ComObjCreate("InternetExplorer.Application")
wb.Visible := True
wb.Navigate("http://depapps.dep.state.fl.us/")
WinWaitActive, Oracle Fusion Middleware Forms Services
sleep, 5500
send, MORAN_N
send, {tab}
send, *******
send, {tab}
send, oraprod
send, {enter}
ExitApp
return
Esc:: ExitApp
