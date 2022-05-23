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
Refresh:
wb.Navigate("https://buyer.myfloridamarketplace.com/")
IELoad(wb)
try 
{ 
wb.document.getElementsByName("UserName")[0].value := "nicholas.moran"   
wb.document.getElementById("Password").value := "Cptplanet567"
Send, {enter}
;wb.document.loginForm.submit()
}
Catch 
{

if InStr(wb.LocationURL,"https://buyer.myfloridamarketplace.com/Buyer/Main")
    ExitApp
Else
    Goto, Refresh
}



ExitApp
return
Esc:: ExitApp
return