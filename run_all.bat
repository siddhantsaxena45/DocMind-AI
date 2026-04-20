@echo off
SETLOCAL EnableDelayedExpansion

:: Set colors for the main window (Cyan text on black)
color 0B

echo ===================================================
echo           DocMind - Intelligent PDF Assistant
echo                Startup Script (Windows)
echo ===================================================
echo.

:: Get the directory where the batch file is located
set "BASE_DIR=%~dp0"

echo [1/2] Starting Backend (FastAPI)...
:: We run pip install to ensure all dependencies (like 'trafilatura') are present.
:: Then we start uvicorn using the venv python.
start "DocMind Backend (FastAPI)" cmd /k "cd /d %BASE_DIR%backend && echo Activating Venv... && call venv\Scripts\activate && echo Checking Dependencies... && pip install -r requirements.txt && echo Starting Uvicorn... && venv\Scripts\python -m uvicorn main:app --reload"

echo [2/2] Starting Frontend (Vite)...
start "DocMind Frontend (Vite)" cmd /k "cd /d %BASE_DIR%frontend && echo Starting Vite Dev Server... && npm run dev"

echo.
echo ===================================================
echo  Services launched in separate windows.
echo.
echo  TIP: To run inside VS Code terminals instead:
echo  1. Press Ctrl+Shift+B in VS Code
echo  2. Select "Start DocMind"
echo ===================================================
echo.
pause
