F11::
   hDrwArea := DllCall("GetDC", "uint", Null)
   
   
   xx=800
   Loop, 600
   {
      flipColor := !flipColor
      color = % ((flipColor) ? (0x000000) : (0xFFFFFF))
      yy = %A_index%
      DllCall("SetPixel", "uint", hDrwArea, "int", xx, "int", yy, "uint", color)
   }

   yy=600
   xx=0
   Loop, 800
   {
      flipColor := !flipColor
      color = % ((flipColor) ? (0x000000) : (0xFFFFFF))
      xx = %A_index%
      DllCall("SetPixel", "uint", hDrwArea, "int", xx, "int", yy, "uint", color)
   }
   sleep 2000
       ;this doesnt seem to clear the screen after
   DllCall("ReleaseDC", UInt, 0, UInt, hDrwArea)
   DllCall("FreeLibrary", "UInt", hDrwArea)
return