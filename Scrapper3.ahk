#Maxmem,1000
#Include <JSON>
SetBatchLines, -1
FileRead,ids,ids.txt
ids := StrSplit(ids,"`r`n","`r`n")
/*
line:="id	incidentType	time	isHome	player	assist1`n"
outputFile := FileOpen("incidents.txt","w")
outputFile.Write(line)
outputFile.Close()
*/
for k,id in ids{
	url := "https://api.sofascore.com/api/v1/event/" . id . "/incidents"
	try{
		content := retreaveContent(url)
		value := JSON.Load(content)
		for k, incident in value["incidents"]{
			incidentType := incident.incidentType
			time := incident.time
			isHome := incident.isHome
			player := incident.player.name
			assist1 := incident.assist1.name
			line := id . "	" . incidentType . "	" . time . "	" . isHome . "	" . player . "	" . assist1 . "`n"
			outputFile := FileOpen("incidents.txt","a")
			outputFile.Write(line)
			outputFile.Close()
		}
	}
	catch e
		FileAppend,%id%	%e%`n,ErrorLog2.txt
}

MsgBox,Pronto!
ExitApp
F8::ExitApp

retreaveContent(url){
	WebObj := ComObjCreate("WinHttp.WinHttpRequest.5.1")	
	WebObj.Open("GET",url)
	WebObj.Send()
	HtmlText := WebObj.ResponseText
	return HtmlText
}
