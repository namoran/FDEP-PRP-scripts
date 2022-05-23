#persistent
WinWaitActive, AutoHotkey Help
ToolTip,  Timed ToolTip`nThis will be displayed for 5 seconds.
SetTimer, RemoveToolTip, -5000
return

RemoveToolTip:
ToolTip
return