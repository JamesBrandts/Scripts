ano2:="|<>*137$47.00000E01y00010820000000439lnYQXc2aG8d5AzX8YEG2FU4T8UY4X0QUF18960dYW+FHDu9l3YQXc"
num:="|<>*140$43.00U0000EEU0000A80000054WTQQQuWFAmN8n98YF8YFWYG8bm8lG94G14MN4W9YXA4SF4QEu"
doc:="|<>*146$62.y00000000U8E0000000822C78br77bCUaG+9aHNYaM94UWF4WF962F88YFDYGFUYG294G14YMFYWaF4mF9bsC7DYF74HCU"
d1:="|<>*181$4.4z4F4FU"
d2:="|<>*182$6.SWX26AMkzU"
d3:="|<>*172$5.RA8n137o"
d4:="|<>*190$6.6CCSqaz66U"
d5:="|<>*176$6.ykUyW33WwU"
d6:="|<>*174$5.Ra7glXZo"
d7:="|<>*175$6.z24A88MEEU"
d8:="|<>*177$5.RCArFX5o"
d9:="|<>*171$5.RiARj3Bo"
d0:="|<>*179$5.RiAMlXho"
CoordMode,Mouse
SetMouseDelay,0
SetKeyDelay,0,0

F3::
loop,17
{
  aj:=1
  loop,100
    if (a:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*178$57.4189Dl3wDUk9184AEn6+1891WW2EFM918MKEG3N18926G2EPs918kyEG3FV89A4O2EK69X91VEn6Uy7lTsDw7Y"))
    {
      aj:=0
      break
    }
    if (aj=1)
    {
      send,{Down}
      loop,100
        if (a:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*178$57.4189Dl3wDUk9184AEn6+1891WW2EFM918MKEG3N18926G2EPs918kyEG3FV89A4O2EK69X91VEn6Uy7lTsDw7Y"))
        {
          aj:=0
          break
        }
  }
      
  anodoc:=ProcuraNumero(a.1.x-220,a.1.y-4,a.1.x-180,a.1.y+4)
  numdoc:=ProcuraNumero(a.1.x-150,a.1.y-4,a.1.x-100,a.1.y+4)
  MouseClick,left,a.1.x,a.1.y
  send,{Alt}ar
  loop
    if(r:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*137$66.DDUk1s02080E8kk140U060U8Ec140U000U8F814RuCSCU8F814WWM2FU8F4tsyWECFU8Hw10UWEGFE8W410kWMGFDD6210SuCSC000000006000000000020000000000A00U"))
      break
  MouseClick,left,r.1.x,r.1.y
  loop
    if(s:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*142$20.007k00wtw7CR8nbH4tosCTD3U3ks0wDzz3zzkzzwC073jxkvzQCzr3jxkvzQ0000002"))
      break
  MouseClick,left,s.1.x,s.1.y
  WinWait,Salvar como
  send,CDA %anodoc%-%numdoc%.pdf`n
  loop
    if(x:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,  "|<>*180$16.001U1b0CS1swD1ts3z07s0TU3z0SS3kwS1tk3U00U"))
      break
  MouseClick,left,x.1.x,x.1.y
  loop
    if (exer:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*135$47.00000E01y00010820000000439lnYQXc2aG8d5AzX8YEG2FU4T8UY4X0QUF18960dYW+FHDu9l3YQXc"))
      break
  MouseClick,left,exer.1.x+100,exer.1.y+200
  Sleep,200
  send,{Down}
  Sleep,300

}
;~ MsgBox,%exercicio%/%numero% - %anodoc%/%numdoc% - %data%

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