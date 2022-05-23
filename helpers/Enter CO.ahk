;-------------------------------------------------------------------
;ENTER CO Button
;-------------------------------------------------------------------

Gui, Add, Button, x1 y24 w70 h30 , ENTER
Gui, Add, ComboBox, x71 y24 w70 h24 , ComboBox
Gui, Add, CheckBox, x141 y24 w80 h30 , Revised
Gui, Add, DateTime, x221 y24 w100 h30 , 
Gui, Add, Radio, x331 y24 w40 h30 , 2
Gui, Add, Radio, x371 y24 w40 h30 , 5
Gui, Add, Text, x1 y4 w70 h20 , Enter CO
Gui, Add, Text, x71 y4 w60 h20 , CO#
Gui, Add, Text, x331 y4 w80 h20 , TAT
; Generated using SmartGUI Creator 4.0
Gui, Show, x718 y345 h63 w423, New GUI Window
Return

ENTER:
msgbox hi there


GuiClose:
ExitApp