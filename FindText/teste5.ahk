hdc:=DllCall("GetDC","Ptr",hwnd)
a:=DllCall("BitBlt", "uint", hdc, "int", 0, "int", 0, "int", 200, "int", 200, "uint", hdc, "int", 0, "int", 0, "uint", "DSTINVERT")
MsgBox,%a%
ExitApp