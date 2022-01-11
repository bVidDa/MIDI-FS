@echo off
start /B "" "%~dp0\python\python.exe" "%~dp0\Glass_Server\server.py" 2>nul 1>nul
start /B "" "%~dp0\python\python.exe" "%~dp0\httpudp.py" 2>nul 1>nul
"%~dp0\python\python.exe" "%~dp0\simulator.py"