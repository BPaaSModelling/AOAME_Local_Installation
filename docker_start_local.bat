
@echo off

REM Get the directory of the script
set SCRIPT_DIR=%~dp0

REM Change to the script's directory
cd /d %SCRIPT_DIR%

REM Display the current directory
echo Current Directory: %cd%

REM Run Docker Compose to start the services
docker compose up --watch

REM Keep the window open
pause
