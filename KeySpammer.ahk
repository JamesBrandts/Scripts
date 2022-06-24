winTitle := "Sem título - Bloco de notas" ;The Diablo window name can be obtained using the Window Spy, Clicking with the right button on the Autohotkey Incon on the system tray (Green H)
F3::
active := true
;SetTimer,Press1,500 ; You can add a semicolon in the star of the line to deactivate this button
SetTimer,Press2,1000 ;This is the interval between presses of this button in miliseconds
SetTimer,Press3,600
SetTimer,Press4,900
return
F4::
active := !active
return
Press1:
if(WinActive(winTitle) and active)
	send,1
return
Press2:
if(WinActive(winTitle) and active)
	send,2
return
Press3:
if(WinActive(winTitle) and active)
	send,3
return
Press4:
if(WinActive(winTitle) and active)
	send,4
return
F8::ExitApp
