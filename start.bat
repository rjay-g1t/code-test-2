@echo off
echo ========================================
echo    AI Image Gallery - Full Stack App
echo ========================================
echo.
echo Starting both Frontend and Backend...
echo.

REM Check if virtual environment exists
if not exist ".venv\Scripts\activate" (
    echo Error: Virtual environment not found at .venv\Scripts\activate
    echo Please run setup.bat first.
    pause
    exit /b 1
)

REM Start backend in a new window
echo [1/2] Starting Backend Server...
start "AI Gallery Backend" cmd /c "call .venv\Scripts\activate && cd backend && python main.py && pause"

REM Wait a moment for backend to start
timeout /t 3 /nobreak >nul 2>&1

REM Start frontend in a new window
echo [2/2] Starting Frontend Server...
start "AI Gallery Frontend" cmd /c "cd frontend && npm start && pause"

echo.
echo ========================================
echo   Both servers are starting up!
echo ========================================
echo.
echo Backend:  http://localhost:8000
echo Frontend: http://localhost:3000
echo.
echo Press any key to continue...
pause >nul
