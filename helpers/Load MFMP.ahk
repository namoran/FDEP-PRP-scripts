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
wb.Navigate("https://buyer.myfloridamarketplace.com/Buyer/Main/ad/loginPage/SSOActions?awsso_cc=awsso_ru%3AaHR0cHM6Ly9idXllci5teWZsb3JpZGFtYXJrZXRwbGFjZS5jb20vQnV5ZXIvTWFpbg%3D%3D%3Bawsso_lu%3AaHR0cHM6Ly9idXllci5teWZsb3JpZGFtYXJrZXRwbGFjZS5jb20vQnV5ZXIvTWFpbi9hZC9jbGllbnRMb2dvdXQvU1NPQWN0aW9ucw%3D%3D%3Bawsso_ap%3AQnV5ZXI%3D%3Bawsso_arid%3AMTQ4MjE3MDY5OTI0NA%3D%3D%3Bawsso_ku%3AaHR0cHM6Ly9idXllci5teWZsb3JpZGFtYXJrZXRwbGFjZS5jb20vQnV5ZXIvTWFpbi9hZC9jbGllbnRLZWVwQWxpdmUvU1NPQWN0aW9ucw%3D%3D%3Bawsso_fl%3AMQ%3D%3D&awsso_ap=Buyer&awsso_hpk=true&awsso_st=1&passwordadapter=CryptPasswordAdapter&awsr=true&awsso_ali=%2FBuyer%2FMain%2Fad%2FappLoginInputs%2Fariba.htmlui.orms.CommonDirectAction")
IELoad(wb)
send, nicholas.moran
send, {tab}
send, Cptplanet88
send, {enter}
ExitApp
return
Esc:: ExitApp
return