#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;This script was created with the help of u/SMFX on r/powershell and awel20 from the AHK forum.

if 0 != 1  ; The left side of a non-expression if-statement is always the name of a variable.
{
    MsgBox This script requires you to drop a file on it to activate.
    ExitApp
}
GivenPath = %1%  ; Fetch the contents of the variable whose name is contained in A_Index.
    Loop %GivenPath%, 1
        Path = %A_LoopFileLongPath%
    SplitPath, Path, FileName, Dir, Ext, NameNoExt
    if (Ext = "xlsx" || Ext = "xls"|| Ext = "xlsm")
        && FileExist(Path)
        && RegExMatch(NameNoExt, "(?<Base>AttachmentB)-((?<rev>Revision)(?<idx>\d+))?-?(?<Suff>.+)", Match)
    {
        msgbox, %MatchBase%
	msgbox, %Matchidx%
	msgbox, %Matchrev%
	msgbox, %MatchSuff%
	
        if (Matchidx == "")
            Matchidx = 0
	msgbox, %Matchidx%
        while FileExist(NewPath := Dir "\" MatchBase "-Revision" A_Index + Matchidx "-"  MatchSuff "." Ext)
            continue
        FileCopy, % Path, % NewPath
    }