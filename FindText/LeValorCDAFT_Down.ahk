SetKeyDelay,0,0
SetMouseDelay,0
CoordMode,mouse
d1:="|<>*166$3./d99U"
d2:="|<>*168$4.yF4YXs"
d3:="|<>*167$4.yFQFbs"
d4:="|<>*168$4.AryzAk2"
d5:="|<>*168$4.y8wFbs"
d6:="|<>*168$4.yMyNbs"
d7:="|<>*146$4.wG9YF8"
d8:="|<>*173$4.yNOMbs"
d9:="|<>*138$4.uMblbc"
d0:="|<>*168$4.SNaNZs"
d10:="|<>*168$1.1s"

du1:="|<>*134$4.BzgnAnU"
du2:="|<>*124$5.RY8FaNXw"
du3:="|<>*133$5.RgNVV3ho"
du4:="|<>*141$5.6QuxnyAQ"
du5:="|<>*133$5.TX7gV3Zo"
du6:="|<>*133$5.Ti7hlXho"
du7:="|<>*135$4.wmNAn8U"
du8:="|<>*132$5.RjCrNXZo"
du9:="|<>*127$5.RiARj3ho"
du0:="|<>*123$5.RiAMlXho"

du1:="|<>*181$4.4z4F4FU"
du2:="|<>*162$7.D8YM8AAAADw"
du3:="|<>*172$5.RA8n137o"
du4:="|<>*190$6.6CCSqaz66U"
du5:="|<>*176$6.ykUyW33WwU"
du6:="|<>*174$5.Ra7glXZo"
du7:="|<>*175$6.z24A88MEEU"
du8:="|<>*177$5.RCArFX5o"
du9:="|<>*171$5.RiARj3Bo"
du0:="|<>*179$5.RiAMlXho"

du1:="|<>*131$3./d99A"
du2:="|<>*110$5.R68F4F3w"
du3:="|<>*130$5.R48H135o"
du4:="|<>*163$5.6QuxnyAQ"
du5:="|<>*131$5.T27cV35o"
du6:="|<>*138$5.R67clX5o"
du7:="|<>*137$5.y4EW4MV4"
du8:="|<>*126$5.R6ALFX5o"
du9:="|<>*131$5.R6AMj35o"
du0:="|<>*110$5.R6AMlX5o"
du10:="|<>*167$1.0D"
;~ d10:="|<>*168$1.1s"


return

F3::
loop,1088
{
	n:=FindText(0, 0, A_ScreenWidth, A_ScreenHeight, 0, 0, "|<>*157$31.4ze2C324V8mV2F89EV8Y4YEWG2y8FF1F48cUUG4A8s9243Y")
    MouseClick,left,n.1.x,n.1.y
    cda:=FindText(0, 0, A_ScreenWidth, A_ScreenHeight, 0, 0, "|<>*120$10.31zgnn3A7y3AAwnTsA8")
    MouseClick,left,cda.1.x,cda.1.y
	Loop
		if (vencida:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*138$42.UU00420EU00020FCD3YSCFNAYImF9F8Y4W1+T8Y4WD+E8Y4WF6N8YImF4C8XYSDU"))
			break

	Sleep,500
	Loop
		if (vencer:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*139$39.UU00002400000FCD3XXe/9YWmE9F8Y4G1Ht4UyE+E8Y420n94WmE4C8XXWA"))
			break
	val:=ProcuraValor(vencida.1.x+20,vencida.1.y-5,vencer.1.x-22,vencida.1.y+6)
    if (val<1892)
      MsgBox,%val%
    Loop
      if(ident:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*131$47.UE00Yw010U011002D77bLFlomNAYYYIN4WF9980m9wWGGEDYG14YYUXAaG99956D74HGFlw"))
        break
    ;~ MouseMove,ident.1.x,ident.1.y
    ;~ return
    MouseClick,left,ident.1.x+680,ident.1.y-21
	Loop
		if (!FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*131$47.UE00Yw010U011002D77bLFlomNAYYYIN4WF9980m9wWGGEDYG14YYUXAaG99956D74HGFlw"))
			break
	;~ Loop
		;~ if (tela:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*140$43.00U0000EEU0000A80000054WTQQQuWFAmN8n98YF8YFWYG8bm8lG94G14MN4W9YXA4SF4QEu"))
			;~ break
	;~ MouseClick,left,tela.1.x,tela.1.y
    Sleep,100
	send,{Down}
	Sleep,300
}
return
F4::Pause
return
F8::ExitApp
return

ProcuraValor(x1,y1,x2,y2)
{
  i:=0
  num:=0
  mult:=1
  x3:=x2-8
  Loop
  {
    i:=0
    loop,11
    {
      if (ok:=FindText(x3, y1, x2, y2, 0, 0, du%i%))
      {
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
        break
      }
      i++
    }
	if(i=10)
	{
		num:=num/mult
		mult:=1
	}
    if i<10
    {
      num+=i*mult
      mult*=10  
      x2:=X
      x3:=X-8
    }
    else
    {
      x3--
      x2--
    }
  }
  until x3<x1
  return num
}


ProcuraNumero(x1,y1,x2,y2)
{
  i:=0
  num:=0
  mult:=1
  x3:=x2-8
  Loop
  {
    i:=0
    loop,10
    {
      if (ok:=FindText(x3, y1, x2, y2, 0, 0, du%i%))
      {
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
        break
      }
      i++
    }
    if i<10
    {
      num+=i*mult
      mult*=10  
      x2:=X
      x3:=X-8
    }
    else
    {
      x3--
      x2--
    }
  }
  until x3<x1
  return num
}