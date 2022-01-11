#SingleInstance force
#Persistent

#include AutoHotInterception\AutoHotInterception.ahk
AHI := new AutoHotInterception()
setKeyDelay 10,40

keyboardId := AHI.GetKeyboardId(0x0603, 0x00F7)
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad1"), true, Func("Key1"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad2"), true, Func("Key2"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad3"), true, Func("Key3"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad4"), true, Func("Key4"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad5"), true, Func("Key5"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad6"), true, Func("Key6"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad7"), true, Func("Key7"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad8"), true, Func("Key8"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad9"), true, Func("Key9"))
AHI.SubscribeKey(keyboardId, GetKeySC("Numpad0"), true, Func("Key0"))

AHI.SubscribeKey(keyboardId, GetKeySC("Tab"), true, Func("KeyTab"))
AHI.SubscribeKey(keyboardId, GetKeySC("Backspace"), true, Func("KeyBack"))
AHI.SubscribeKey(keyboardId, GetKeySC("NumpadEnter"), true, Func("KeyEnter"))
AHI.SubscribeKey(keyboardId, GetKeySC("NumpadMult"), true, Func("KeyMult"))
AHI.SubscribeKey(keyboardId, GetKeySC("NumpadDiv"), true, Func("KeyDiv"))
AHI.SubscribeKey(keyboardId, GetKeySC("NumpadAdd"), true, Func("KeyAdd"))
AHI.SubscribeKey(keyboardId, GetKeySC("NumpadSub"), true, Func("KeySub"))
AHI.SubscribeKey(keyboardId, GetKeySC("NumpadDot"), true, Func("KeyDot"))

return

Key1(state){
}

Key2(state){
}

Key3(state){
}

Key4(state){
if (state == 1) {
	ControlSend, , ^{F2}, ahk_exe obs32.exe
}	}

Key5(state){
if (state == 1) {
	ControlSend, , +{F2}, ahk_exe obs32.exe
}	}

Key6(state){
if (state == 1) {
	ControlSend, , ^{F4}, ahk_exe obs32.exe
}	}

Key7(state){
if (state == 1) {
	ControlSend, , +{F7}, ahk_exe obs32.exe
}	}

Key8(state){
if (state == 1) {
	ControlSend, , +{F8}, ahk_exe obs32.exe
}	}

Key9(state){
if (state == 1) {
	ControlSend, , +{F4}, ahk_exe obs32.exe
}	}

Key0(state){
if (state == 1) {
	ControlSend, , +{F3}, ahk_exe obs32.exe
}	}


KeyTab(state){
if (state == 1) {
	ControlSend, , +{F6}, ahk_exe obs32.exe
}	}

KeyBack(state){
}

KeyEnter(state){
if (state == 1) {
	ControlSend, , {F9}, ahk_exe obs32.exe
}	}

KeyMult(state){
if (state == 1) {
	ControlSend, , +{F9}, ahk_exe obs32.exe
}	}

KeyDiv(state){
if (state == 1) {
	ControlSend, , {F6}, ahk_exe obs32.exe
}	}

KeyAdd(state){
}

KeySub(state){
}

KeyDot(state){
if (state == 1) {
	ControlSend, , ^{F3}, ahk_exe obs32.exe
}	}
