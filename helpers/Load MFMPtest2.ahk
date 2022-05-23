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
    Until (wb.busy || A_Index > 50)
    Loop    ;Once it starts loading wait until completes
        Sleep,100
    Until (!wb.busy)
    
Return True
}


SplitPath, A_WorkingDir, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
RegExMatch(OutDir,"\d\d\d\d\d\d\d", FDEPNo)

If (FDEPno = ""){
	MsgBox, Cannot run this from here, App will Exit
	ExitApp
	}	
	

MsgBox, %OutDir%
MsgBox, %FDEPno%


wb := ComObjCreate("InternetExplorer.Application")
wb.Visible := True
Refresh:
wb.Navigate("https://buyer.myfloridamarketplace.com/")
IELoad(wb)
try 
{ 
wb.document.getElementsByName("UserName")[0].value := "nicholas.moran"   
wb.document.getElementById("Password").value := "Cptplanet2022"
Send, {enter}
IELoad(wb)
Goto, searchFDEPno
;wb.document.loginForm.submit()
}
Catch 
{

if InStr(wb.LocationURL,"https://buyer.myfloridamarketplace.com/Buyer/Main")
    Goto, searchFDEPno
Else
    Goto, Refresh
}
searchFDEPno:
SplashTextOn,400,,Searching for Site in MFMP -Don't Touch Keyboard- Press esc to quit
;IELoad(wb)
Sleep, 50
Send, {Tab}
Sleep, 50
Send,{Enter}
IELoad(wb)
Send, ^f
Sleep, 50
Send, %FDEPno%
Sleep, 50
Send, {Enter}
IELoad(wb)
Send, {Enter}
Sleep, 50
Send, {Tab 2}
Sleep, 50
Send, +{Tab}
Send, {Enter}
IELoad(wb)
Send, {End}
SplashTextOff
ExitApp
return
Esc:: ExitApp
return