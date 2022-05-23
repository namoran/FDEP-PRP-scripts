#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Event  ; Recommended for new scripts due to its superior speed and reliability.
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
wb.Navigate("http://ssrs2008.miamidade.gov/Reports/Pages/Report.aspx?ItemPath=%2fSSRS+Intranet%2fRER%2fERM%2fReports%2fPROD%2fEnv_Monitoring_Pol_Reg%2fRemediation%2fBacklog_Remediation")
IELoad(wb)
wb.document.getElementById("ctl32_ctl04_ctl03_ddValue").value := "22"
wb.document.getElementById("ctl32_ctl04_ctl00").click()

ExitApp
return
Esc:: ExitApp
return
