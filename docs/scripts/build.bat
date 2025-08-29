@echo off
echo ========================================
echo    Building AI Image Gallery for Production
echo ========================================

echo.
echo [1/3] Building React frontend...
cd frontend

echo Installing dependencies...
npm install

echo Creating production build...
npm run build

echo.
echo [2/3] Testing backend dependencies...
cd ../backend

echo Activating virtual environment...
if exist ".venv\Scripts\activate" (
    call .venv\Scripts\activate
) else (
    echo Creating virtual environment...
    py -m venv .venv
    call .venv\Scripts\activate
)

echo Installing Python dependencies...
pip install -r requirements.txt

echo.
echo [3/3] Validating build...
echo Frontend build: frontend/build/
echo Backend ready: backend/

echo.
echo ========================================
echo    Production Build Complete!
echo ========================================
echo.
echo Frontend build located in: frontend/build/
echo Deploy backend using: uvicorn main:app --host 0.0.0.0 --port 8001
echo.
echo Press any key to exit...
pause >nul
