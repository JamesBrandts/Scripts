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
d10:="|<>*168$1.0Q"
F3::




	;~ Loop
		;~ if (impostos:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*136$10.31zgnn3A7y3AAwnTsA8"))
			;~ break
	;~ MouseClick,left,impostos.1.x,impostos.1.y
	Loop
		if (vencida:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*146$38.kk008E48000412QwQjDNd99eGGHuG3YQgUYUt96998eGFVmFmwy"))
			break
	Loop
		if (vencer:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*141$43.E000000462000001200003UVCSCCSE9d98d8s4boY7oY2G2G22G0l9959D0MQYQQY"))
			break
	
	v:=FindText(vencida.1.x+20,vencida.1.y-5,vencer.1.x-22,vencida.1.y+5,0,0,d10)
	MouseMove,v.1.x,v.1.y
	num:=ProcuraNumero(vencida.1.x+20,vencida.1.y-5,vencer.1.x-22,vencida.1.y+5)
	
	;~ FileAppend,%line%%A_Tab%%num%`n,valores4.txt
	MsgBox,%num%

return
F4::Pause
return
F8::ExitApp
return
ProcuraNumero(x1,y1,x2,y2)
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