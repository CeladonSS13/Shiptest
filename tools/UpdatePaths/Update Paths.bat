@echo off
call "%~dp0\..\bootstrap\python" -m UpdatePaths %* -d "%~dp0/../../_maps/_mod_celadon"
pause
