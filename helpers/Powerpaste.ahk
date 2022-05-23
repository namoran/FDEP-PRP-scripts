#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

file = %1% ; Get the command-line parameter, which is the file to read.
If (file = "") ; Check for a missing parameter.
{
 MsgBox File was not specified.
 ExitApp
}
If !FileExist(file) ; See if the file exists.
{
 MsgBox File '%file%' was not found.
 ExitApp
}
txt := FileOpen(file, "r") ; Open the text file for reading.
if !IsObject(txt)
{
 MsgBox Can't open '%file%' for reading.
 ExitApp
}
F12:: ; Read and paste the next line.
line := txt.ReadLine() ; Read the next line from the text file.
If (line > "") ; See if a line was found.
{
 Clipboard := line ; Copy the line to the Windows clipboard.
 Sleep, 50
 Send ^v ; Paste the line into the active window.
}
Else ; The line is null or did not exist (i.e., end of file).
{
 MsgBox, Done.
 txt.Close() ; Close the file.
 FileRecycle, %file% ; Delete the file.
 If (ErrorLevel = 1)
  MsgBox, '%file%' could not be deleted.
 ExitApp
}
Return