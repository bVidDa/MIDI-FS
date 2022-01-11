
import code
import readline
import rlcompleter

def copen(_globals, _locals):
    context = _globals.copy()
    context.update(_locals)
    readline.set_completer(rlcompleter.Completer(context).complete)
    readline.parse_and_bind("tab: complete")
    shell = code.InteractiveConsole(context)
    shell.interact()
	
from pyxpudpserver import pyXPUDPServer as XPUDP
from SimConnect import SimConnect
import socket

XPUDP.initialiseUDP(('127.0.0.1',49002),('127.0.0.1',49000),socket.gethostname())
XPUDP.start()

copen(
globals(),
locals())
