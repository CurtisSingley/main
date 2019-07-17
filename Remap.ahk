#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CapsOn=false

F11::Send {vkAEsc12E}
F12::Send {vkAFsc130}
F10::Send {vkADsc120}
#j::Send {Down}
#k::Send {Up}
#u::Send {Up 14}
#h::Send #{d}
#d::Send {Down 14}

*Capslock::
;suspend to prevent calling esc
Suspend on
Send, {ESC}
Suspend off
return

Esc::
;use global variable to keep track of state
if CapsOn = false
{
 CapsOn = true
 SetCapsLockState, on
}
else
{
 CapsOn = false
 SetCapsLockState, off
}
return
