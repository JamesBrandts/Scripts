s:=""
loop Files,C:\Macro\CDAs Corrigidas\*.pdf
	s .= A_LoopFileName . "`r`n"
FileAppend,%s%,s.txt
Run,"s.txt"
Sleep,1000
FileDelete,s.txt
ExitApp