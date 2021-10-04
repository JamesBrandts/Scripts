ano:="|<>*137$47.00000E01y00010820000000439lnYQXc2aG8d5AzX8YEG2FU4T8UY4X0QUF18960dYW+FHDu9l3YQXc"
num:="|<>*140$43.00U0000EEU0000A80000054WTQQQuWFAmN8n98YF8YFWYG8bm8lG94G14MN4W9YXA4SF4QEu"
d1:="|<>*181$4.4z4F4FU"
d2:="|<>*162$7.D8YM8AAAADw"
d3:="|<>*172$5.RA8n137o"
d4:="|<>*190$6.6CCSqaz66U"
d5:="|<>*176$6.ykUyW33WwU"
d6:="|<>*174$5.Ra7glXZo"
d7:="|<>*175$6.z24A88MEEU"
d8:="|<>*177$5.RCArFX5o"
d9:="|<>*171$5.RiARj3Bo"
d0:="|<>*179$5.RiAMlXho"
CoordMode,Mouse

F3::
ok:=FindText(0, 0, 1400, 900, 0, 0, ano)
X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
xa:=X+26
ya:=Y-8
xb:=X+70
yb:=Y+7
exercicio:=ProcuraNumero(xa,ya,xb,yb)
ok:=FindText(0, 0, 1400, 900, 0, 0, num)
X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
xa:=X+26
ya:=Y-8
xb:=X+70
yb:=Y+7
numero:=ProcuraNumero(xa,ya,xb,yb)

MsgBox,%exercicio%/%numero%

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
    loop,10
    {
      if (ok:=FindText(x3, y1, x2, y2, 0, 0, d%i%))
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
F8::ExitApp