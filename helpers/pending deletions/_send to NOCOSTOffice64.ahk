#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse, Screen


if 0 != 1  ; The left side of a non-expression if-statement is always the name of a variable.
{
    MsgBox This script requires you to drop a file on it to activate.
    ExitApp
}
GivenPath = %1%  ; Fetch the contents of the variable whose name is contained in A_Index.
    Loop %GivenPath%, 1
        LongPath = %A_LoopFileLongPath%
FACID := SubStr(LongPath, -12 , 9)
MouseGetPos, OutputVarX, OutputVarY
InputBox, refno, Reference Number, Please Enter the Reference Number from the CO,,200,150, OutputVarX, OutputVarY 
if ErrorLevel
    ExitApp
;msgbox, %FACID%

Run %comspec% /C ""C:\Program Files\Microsoft Office\Office16\OUTLOOK.EXE"/c ipm.note /m "prp.nocostchange@dep.state.fl.us &cc=didier.camacho@miamidade.gov`; James.Fletcher@dep.state.fl.us &subject=%FACID% - %refno% - Date Extension Only" /a "%LongPath%"",,Hide
WinWait, %FACID% - %refno% - Date Extension Only
WinActivate, %FACID% - %refno% - Date Extension Only
Send,{Enter} Please see the attached Date Extension Only CO for the above referenced site
ExitApp
