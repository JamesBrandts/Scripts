
F3::
o:=""
Clipboard:=""
Loop,17
{
	o .= Clipboard . "`r`n"
	send,^c
	send,{Down}
	sleep,200
}

Clipboard := o

F8::ExitApp
F4::Pause