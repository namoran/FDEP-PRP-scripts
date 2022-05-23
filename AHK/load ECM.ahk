
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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
wb.Visible := True
wb.Navigate("https://ecmprod-apps.miamidade.gov/RER_DERM_PERMITS/signin.jsp")
IELoad(wb)
wb.document.getElementById("j_username-inputEl").value := "e317181"
wb.document.getElementById("j_password-inputEl").value := "Cptplanet456"
send,{enter}

ExitApp
return
Esc:: ExitApp
return