@echo off
SET PYTHONPATH=%~dp0\WinPython\python-3.11.3.amd64
SET PATH=%~dp0\WinPython\python-3.11.3.amd64;%PATH%
start "" "%~dp0\VSCode-Portable\Code.exe" "%~dp0\nanogpt-from-scratch"