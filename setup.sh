#!/bin/bash

echo "========================================"
echo "    AI Image Gallery - Setup Script"
echo "========================================"
echo
echo "This script will set up your development environment."
echo

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed"
    echo "Please install Python 3.8+ and try again"
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Error: Node.js is not installed"
    echo "Please install Node.js 18+ and try again"
    exit 1
fi

echo "[1/4] Creating Python virtual environment..."
python3 -m venv .venv
if [ $? -ne 0 ]; then
    echo "Error: Failed to create virtual environment"
    exit 1
fi

echo "[2/4] Installing Python dependencies..."
if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
elif [ -f ".venv/Scripts/activate" ]; then
    source .venv/Scripts/activate
else
    echo "Error: Could not find virtual environment activation script"
    exit 1
fi

pip install -r backend/requirements.txt
if [ $? -ne 0 ]; then
    echo "Error: Failed to install Python dependencies"
    exit 1
fi

echo "[3/4] Installing frontend dependencies..."
cd frontend
npm install
if [ $? -ne 0 ]; then
    echo "Error: Failed to install frontend dependencies"
    exit 1
fi
cd ..

echo "[4/4] Setup complete!"
echo
echo "========================================"
echo "       Setup Successful!"
echo "========================================"
echo
echo "Next steps:"
echo "1. Configure your .env files (see README.md)"
echo "2. Set up your Supabase database (see docs/DATABASE_SETUP.md)"
echo "3. Run './start.sh' to start both servers"
echo
