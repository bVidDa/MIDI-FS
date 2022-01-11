
#Persistent

Run, Simulator.bat, , , myPID
; MsgBox, , %myPID%
OnExit("pyclose")

return

pyclose(bar1,bar2){
DetectHiddenWindows On
global myPID
	WinClose ahk_pid %myPID%
	Process, WaitClose, %myPID%
}

NumpadAdd::
ControlSend, , 3 {NumpadAdd} 2 {Enter}, ahk_pid %myPID%
return