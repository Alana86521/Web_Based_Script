@echo off
setlocal enabledelayedexpansion

:: Setting up a simple HTTP server using a batch file and curl
:: Send commands to the Lua script

:menu
cls
echo 1. Enable ESP
echo 2. Increase Speed
echo 3. Exit
set /p choice=Choose an option:

if "%choice%"=="1" (
    curl -X POST -d "{\"command\":\"enable_esp\"}" http://localhost:5000/command
    goto menu
)

if "%choice%"=="2" (
    curl -X POST -d "{\"command\":\"increase_speed\"}" http://localhost:5000/command
    goto menu
)

if "%choice%"=="3" (
    exit
)

goto menu
