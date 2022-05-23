#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

UrlDownloadToFile, ftp://ftp.dep.state.fl.us/pub/reports/pc/contfacs.XLS, \\ecsfs1\DERMPublic\Environmental Monitoring Restoration\PC\Pollution Remediation\Nicholas Share\PENpal Utility\contfacs.xlsx

