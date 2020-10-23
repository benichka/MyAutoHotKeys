; https://www.autohotkey.com/docs/Hotkeys.htm#Symbols
; #: Win key.
; !: Alt.
; ^: Control.
; +: Shift.

; Rebind capslock to control:
CapsLock::LCtrl

; en dash:
^-::Send {U+2013}

; Emulate snipping tool as in Windows 10 (almost):
; win + shift + s opens SnippingTool and instantly
; launches a rectangle capture.
#+s::
  ; If the window already exists, we simply kill it to avoid problem
  ; (both the program and the capture window have the same name and
  ; it can be hard to properly deal with those 2).
  if WinExist("ahk_class Microsoft-Windows-Tablet-SnipperToolbar")
  {
    WinClose
  }

  ; open it and grab its pid.
  Run, C:\Windows\system32\SnippingTool.exe, , , SnipPID
  ; wait for the window to be loaded.
  WinWait, ahk_pid %SnipPID%

  ; Launch the capture in SnippingTool.
  Send ^{PrintScreen}
Return
