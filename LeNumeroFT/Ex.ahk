FileRead, list, list.txt ; Read the file
list := StrSplit(list, "`n", "`r`n") ; Split each line in a element of an array
output := ""
for index, line in list
	if (SubStr(line,1,8) = "CDA 2021") ; Makes a simple verification on the line
		output .= line . "`r`n" ; If the line attends add it to the output var

loop ; Loop until there's no file with the same name
	FileMove, list.txt, list(Old %A_Index%).txt ; Rename the old file
Until ErrorLevel = 0

FileAppend, %output%, list.txt ;Create the new file with the output variable
