SetKeyDelay,0,0
SetMouseDelay,0
CoordMode,mouse
Gui, Add, DropDownList, x50 y10 w150 vFiltro Choose1, Economia/Inscrição|Economia/Matrícula|Cadastro Geral/Inscrição|Cadastro Geral/CPF|Processo/Ano-Numero|Processo/Economia
Gui, Add, Edit, x50 y40 w150 vLista,lista.txt
Gui, Add, Text, x10 y10 w40 h20 , Filtro:
Gui, Add, Text, x10 y40 w40 h20 , Lista:
gui,+alwaysontop
ax:=A_ScreenWidth-210
ay:=A_ScreenHeight-140
Gui, Show, w210 h70 x%ax% y%ay%, Filtros ERP
localizado := "|<>*136$52.U002E00820008000U8sQwYwwSCaGOGEmGNaFc79278YN6UYYMYWFaGSGH6GNaC7DdDjbXc"
nenhum:="|<>*144$68.008000Y0040E0200080010400U002000E1tk8sQwYxswQQW2FA1922F8a8UYG1mF3YG9W894UYYF94W8W2FA998GF8a70XVnmLrXllU"	
return

F3::
Gui,Submit,NoHide
Switch Filtro
{
	Case "Economia/Inscrição":
	{
		loop
			if p := FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*141$59.00000000+1200GS000g2400UU00004stvfdlllluGGGGIIYIYwboYYc7879t8999EGEGHGGGGGWYWYaQQYoYtstsk0000000U000000000U00000000600U")
				break
		px:=p.1.x+85
		py:=p.1.y
	
	}
	Case "Economia/Matrícula":
	{
		loop
			if p := FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*141$59.00000000+1200GS000g2400UU00004stvfdlllluGGGGIIYIYwboYYc7879t8999EGEGHGGGGGWYWYaQQYoYtstsk0000000U000000000U00000000600U")
				break
		px:=p.1.x+85
		py:=p.1.y+110
	}
	Case "Cadastro Geral/Inscrição":
	{
		loop
			if p := FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*135$48.000000G0U00040g0U0000000bVktoQQCaG954WWNYG114U2FYFl14USFYE914UWFYG954WWNYHkt4QSC000008000000040000000M00U")
				break
		px:=p.1.x+85
		py:=p.1.y
	
	}
	Case "Cadastro Geral/CPF":
	{
		loop
			if p := FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*135$48.000000G0U00040g0U0000000bVktoQQCaG954WWNYG114U2FYFl14USFYE914UWFYG954WWNYHkt4QSC000008000000040000000M00U")
				break
		px:=p.1.x+85
		py:=p.1.y+180
	
	}
	Case "Processo/Ano-Numero":
	{
		loop
			if p := FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*136$70.0U0TU00000000012000000078s49nVlksQCWaEEYN8gYG9a2F1wF4UWE84M94414G3ssQFUYEE4F880E96+N10FYWmF8aL8s413VllswCU")
				break
		px:=p.1.x+85
		py:=p.1.y
	
	}
	Case "Processo/Economia":
	{
		loop
			if p := FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*136$70.0U0TU00000000012000000078s49nVlksQCWaEEYN8gYG9a2F1wF4UWE84M94414G3ssQFUYEE4F880E96+N10FYWmF8aL8s413VllswCU")
				break
		px:=p.1.x+85
		py:=p.1.y+200
	
	}
}
FileRead,lista,%Lista%
lista:=StrSplit(lista,"`n","`r`n")
for key,linha in lista
{
	if (Filtro="Processo/Ano-Numero")
	{
		linha:=StrSplit(linha,"	","	")
		ano:=linha[1]
		pro:=linha[2]
		MouseClick,left,px,py
		Sleep,10
		MouseClick,left,px,py
		send,%ano%%a_tab%%ano%%a_tab%%a_tab%%a_tab%%pro%%a_tab%%pro%	
	}
	else
	{
		MouseClick,left,px,py
		send,{Delete}{Home}+{End}%linha%
		if (Filtro="Economia/Inscrição" or Filtro="Cadastro Geral/Inscrição" or Filtro="Processo/Economia")
		{
			MouseClick,left,px+60,py
			send,{Delete}{Home}+{End}%linha%
		}
	}
	send,!a
	Sleep,20
    Loop
    {
		if (ok:=FindText(0, 0, a_screenwidth, A_ScreenHeight, 0, 0, localizado))
		{
			break
		}
		if (ok:=FindText(0, 0, a_screenwidth, A_ScreenHeight, 0, 0, nenhum))
		{
			send,`n
			Sleep,500
			break
		}
	}
}
send,!t	












return
F8::
GuiClose:
ExitApp