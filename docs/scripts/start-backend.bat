@echo off
echo Starting AI Image Gallery Backend...
cd /d "d:\Cave\test\code-test-2\backend"

REM Check if dependencies are installed
py -m pip list | findstr "fastapi" >nul
if %errorlevel% neq 0 (
    echo Installing dependencies...
    py -m pip install -r requirements.txt
)

echo Starting FastAPI server...
echo Backend will be available at: http://localhost:8000
py -m uvicorn main:app --reload

pause
