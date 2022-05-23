#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Event  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3
SetTitleMatchMode, slow

IELoad(wb)    ;You need to send the IE handle to the function unless you define it as global.
{
    If !wb    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,100
    Until (wb.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,100
    Until (!wb.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,100
    Until (wb.Document.Readystate = "Complete")
Return True
}

wb := ComObjCreate("InternetExplorer.Application")
wb.Visible := False
wb.Navigate("http://depapps.dep.state.fl.us/")

WinWaitActive, Oracle Fusion Middleware Forms Services
WinMove, Oracle Fusion Middleware Forms Services,,956,430,817,590
sleep, 5000
send, MORAN_N
send, {tab}
send, Cptplanet4433
send, {tab}
send, oraprod
send, {enter}

;ControlSend, , MORAN_N, Oracle Fusion Middleware Forms Services
;ControlSend, , {Tab}, Oracle Fusion Middleware Forms Services
;ControlSendRaw, , Cptplanet445, Oracle Fusion Middleware Forms Services
;ControlSend, , {Tab}, Oracle Fusion Middleware Forms Services
;ControlSend, , oraprod, Oracle Fusion Middleware Forms Services
;ControlSend, , {Enter}, Oracle Fusion Middleware Forms Services

WinWaitActive, Florida Department of Environmental Protection - Enterprise Applications
WinMove, Florida Department of Environmental Protection - Enterprise Applications,,956,430,817,590
ExitApp
return
Esc:: ExitApp