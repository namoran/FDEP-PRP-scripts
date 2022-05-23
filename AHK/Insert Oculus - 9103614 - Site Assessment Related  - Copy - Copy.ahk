#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FDEP_ID:= "9103614"
Docu_Type:= "SITE ASSESSMENT RELATED"
FormatTime, Today_date, , MM-dd-yyyy

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

if 0 != 1  ; The left side of a non-expression if-statement is always the name of a variable.
{
    MsgBox This script requires you to drop a file on it to activate.
    ExitApp
}
GivenPath = %1%  ; Fetch the contents of the variable whose name is contained in A_Index.
    Loop %GivenPath%, 1
        LongPath = %A_LoopFileLongPath%
Clipboardarch = %clipboard%

wb := ComObjCreate("InternetExplorer.Application")
wb.Visible := True
wb.Navigate("https://depedms.dep.state.fl.us/Oculus/servlet/login")
IELoad(wb)
wb.document.getElementById("formUser").value := "XXXXXXX"
wb.document.getElementById("formPassword").value := "XXXXXXXXXXX"
wb.document.loginForm.submit()
IELoad(wb)
wb.Navigate("https://depedms.dep.state.fl.us/Oculus/servlet/insert")
IELoad(wb)
Sleep, 800
wb.document.getElementById("_PARA_Document Date").value := Today_date
wb.document.getElementById("_PARA_Received Date").value := Today_date
wb.document.getElementById("_PARA_Document Type").value := Docu_Type
wb.document.getElementById("_PARA_Facility-Site ID").value := FDEP_ID
wb.document.getElementById("_PARA_Document Subject").value := "Supplemental Documentation"
wb.document.getElementById("uploadButton").click()
Sleep, 800
;wb.document.getElementById("fileToLoad").click()

clipboard = %LongPath%
Loop, 500
{
ToolTip, Clipboard loaded with filepath
Sleep, 20
}
toolTip
WinWaitClose, OCULUS - Insert Document - Internet Explorer
msgbox, Insert Oculus app will close`nClipboard will be restored to previous state
Clipboardarch = %clipboard%
return