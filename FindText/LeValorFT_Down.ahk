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

F3::
loop,1
{
	n:=FindText(0, 0, A_ScreenWidth, A_ScreenHeight, 0, 0, "|<>*146$35.0400014E0003800006GHyQvuYYZ94p99/u9aGGI4HAYYd8a9t9CFo")
	num:=ProcuraNumero(n.1.x,n.1.y+15,n.1.x+70,n.1.y+35)
    MsgBox,%num%-%val%
    return
	Loop
		if (impostos:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*136$10.31zgnn3A7y3AAwnTsA8"))
			break
	MouseClick,left,impostos.1.x,impostos.1.y
	send,!l{Tab}01{Tab}2019{Tab}{Tab}{Tab}N{Tab}{Tab}{Tab}{Tab}{Tab}{Tab}01{Tab}2020{Tab}{Tab}{Tab}N{Tab}{Tab}{Tab}{Tab}!l
	Loop
		if (vencida:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*146$38.kk008E48000412QwQjDNd99eGGHuG3YQgUYUt96998eGFVmFmwy"))
			break
	Sleep,500
	Loop
		if (vencer:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*141$43.E000000462000001200003UVCSCCSE9d98d8s4boY7oY2G2G22G0l9959D0MQYQQY"))
			break
	
	val:=ProcuraValor(vencida.1.x+20,vencida.1.y-5,vencer.1.x-22,vencida.1.y+5)
	;~ FileAppend,%num%%A_Tab%%val%`n,valores2.txt
	MsgBox,%num%-%val%
	ident:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*143$30.V009AV0088b7DRQd9998tDd98t8998d9998b79B9U")
	MouseClick,left,ident.1.x+705,ident.1.y-21
	Loop
		if (!FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*143$30.V009AV0088b7DRQd9998tDd98t8998d9998b79B9U"))
			break
	Loop
		if (tela:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*140$43.00U0000EEU0000A80000054WTQQQuWFAmN8n98YF8YFWYG8bm8lG94G14MN4W9YXA4SF4QEu"))
			break
	MouseClick,left,tela.1.x,tela.1.y
	send,{Down}
	Sleep,100
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
      if (ok:=FindText(x3, y1, x2, y2, 0, 0, d%i%))
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