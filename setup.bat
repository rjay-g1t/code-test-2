@echo off
echo ========================================
echo     AI Image Gallery - Setup Script
echo ========================================
echo.
echo This script will set up your development environment.
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python 3.8+ and try again
    pause
    exit /b 1
)

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo Error: Node.js is not installed or not in PATH
    echo Please install Node.js 18+ and try again
    pause
    exit /b 1
)

echo [1/4] Creating Python virtual environment...
python -m venv .venv
if errorlevel 1 (
    echo Error: Failed to create virtual environment
    pause
    exit /b 1
)

echo [2/4] Installing Python dependencies...
call .venv\Scripts\activate
pip install -r backend\requirements.txt
if errorlevel 1 (
    echo Error: Failed to install Python dependencies
    pause
    exit /b 1
)

echo [3/4] Installing frontend dependencies...
cd frontend
npm install
if errorlevel 1 (
    echo Error: Failed to install frontend dependencies
    pause
    exit /b 1
)
cd ..

echo [4/4] Setup complete!
echo.
echo ========================================
echo        Setup Successful!
echo ========================================
echo.
echo Next steps:
echo 1. Configure your .env files (see README.md)
echo 2. Set up your Supabase database (see docs/DATABASE_SETUP.md)
echo 3. Run 'start.bat' to start both servers
echo.
pause
