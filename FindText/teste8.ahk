CoordMode,mouse

F3::
vencida:=FindText(0,0,A_ScreenWidth,A_ScreenHeight,0,0,"|<>*146$38.kk008E48000412QwQjDNd99eGGHuG3YQgUYUt96998eGFVmFmwy")
MouseMove,vencida.1.x,vencida.1.y
v:=FindText(vencida.1.x,vencida.1.y-5,vencida.1.x+200,vencida.1.y+5,0,0,"|<>*138$4.uMblbc")
MouseMove,v.2.x,v.2.y
return
F8::ExitApp