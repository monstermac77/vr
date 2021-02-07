@echo off

:: this file should only be run by the scheduled task in elevated permissions
:: to launch the runtime manually, just run mixedvr-manager.bat as admin

:: file path for MixedVR-Manager from argument passed in by scheduled task
set FilePath=%1

:: call vbs script and pass file path as argument
"%FilePath%\bin\mixedvr-manager-startup.vbs" %FilePath%