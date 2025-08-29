@echo off
echo Starting AI Image Gallery Frontend...
cd /d "d:\Cave\test\code-test-2\frontend"

REM Check if node_modules exists
if not exist "node_modules" (
    echo Installing dependencies...
    npm install
)

echo Starting React development server...
echo Frontend will be available at: http://localhost:3000
npm start

pause
