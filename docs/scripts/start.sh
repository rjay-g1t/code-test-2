#!/bin/bash

echo "========================================"
echo "   AI Image Gallery - Airbnb Style"
echo "========================================"

echo
echo "[1/4] Setting up Python backend..."
cd backend

if [ ! -d ".venv" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv .venv
fi

echo "Activating virtual environment..."
source .venv/bin/activate

echo "Installing Python dependencies..."
pip install -r requirements.txt

echo
echo "[2/4] Starting backend server (Port 8001)..."
gnome-terminal -- bash -c "cd $(pwd) && source .venv/bin/activate && python -m uvicorn main:app --host 0.0.0.0 --port 8001 --reload; exec bash" 2>/dev/null || \
xterm -e "cd $(pwd) && source .venv/bin/activate && python -m uvicorn main:app --host 0.0.0.0 --port 8001 --reload; bash" 2>/dev/null || \
echo "Backend starting in background..."

echo
echo "[3/4] Setting up React frontend..."
cd ../frontend

echo "Installing Node.js dependencies..."
npm install

echo
echo "[4/4] Starting frontend development server..."
gnome-terminal -- bash -c "cd $(pwd) && npm start; exec bash" 2>/dev/null || \
xterm -e "cd $(pwd) && npm start; bash" 2>/dev/null || \
echo "Frontend starting in background..."

echo
echo "========================================"
echo "   Setup Complete!"
echo "========================================"
echo "Frontend: http://localhost:3000"
echo "Backend API: http://localhost:8001"
echo "Backend Docs: http://localhost:8001/docs"
echo
echo "Press any key to exit..."
read -n 1
