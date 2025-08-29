#!/bin/bash

echo "========================================"
echo "   AI Image Gallery - Full Stack App"
echo "========================================"
echo
echo "Starting both Frontend and Backend..."
echo

# Check if virtual environment exists
if [ ! -f ".venv/Scripts/activate" ] && [ ! -f ".venv/bin/activate" ]; then
    echo "Error: Virtual environment not found"
    echo "Please run setup.sh first."
    exit 1
fi

# Determine virtual environment activation script
if [ -f ".venv/Scripts/activate" ]; then
    VENV_ACTIVATE=".venv/Scripts/activate"
else
    VENV_ACTIVATE=".venv/bin/activate"
fi

# Function to check if a port is in use
check_port() {
    local port=$1
    if command -v lsof >/dev/null 2>&1; then
        lsof -i :$port >/dev/null 2>&1
    elif command -v netstat >/dev/null 2>&1; then
        netstat -an | grep :$port >/dev/null 2>&1
    else
        return 1
    fi
}

# Check if ports are available
if check_port 8000; then
    echo "Warning: Port 8000 is already in use. Backend may not start properly."
fi

if check_port 3000; then
    echo "Warning: Port 3000 is already in use. Frontend may not start properly."
fi

# Start backend in background
echo "[1/2] Starting Backend Server..."
source "$VENV_ACTIVATE"
cd backend
python main.py &
BACKEND_PID=$!
cd ..

# Wait for backend to start
sleep 3

# Start frontend in background
echo "[2/2] Starting Frontend Server..."
cd frontend
npm start &
FRONTEND_PID=$!
cd ..

echo
echo "========================================"
echo "   Both servers are running!"
echo "========================================"
echo
echo "Backend:  http://localhost:8000 (PID: $BACKEND_PID)"
echo "Frontend: http://localhost:3000 (PID: $FRONTEND_PID)"
echo
echo "Press Ctrl+C to stop both servers"
echo

# Function to cleanup on exit
cleanup() {
    echo
    echo "Stopping servers..."
    kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
    echo "Servers stopped."
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM
trap cleanup SIGINT SIGTERM

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
