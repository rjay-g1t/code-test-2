@echo off
echo ========================================
echo    AI Image Gallery - Airbnb Style
echo ========================================

echo.
echo [1/4] Setting up Python backend...
cd backend

if not exist ".venv" (
    echo Creating Python virtual environment...
    py -m venv .venv
)

echo Activating virtual environment...
call .venv\Scripts\activate

echo Installing Python dependencies...
pip install -r requirements.txt

echo.
echo [2/4] Starting backend server (Port 8001)...
start "AI Gallery Backend" cmd /k "call .venv\Scripts\activate && py -m uvicorn main:app --host 0.0.0.0 --port 8001 --reload"

echo.
echo [3/4] Setting up React frontend...
cd ../frontend

echo Installing Node.js dependencies...
npm install

echo.
echo [4/4] Starting frontend development server...
start "AI Gallery Frontend" cmd /k "npm start"

echo.
echo ========================================
echo    Setup Complete!
echo ========================================
echo Frontend: http://localhost:3000
echo Backend API: http://localhost:8001
echo Backend Docs: http://localhost:8001/docs
echo.
echo Press any key to exit...
pause >nul
