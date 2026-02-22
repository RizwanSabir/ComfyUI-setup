#!/bin/bash

set -e

echo "===== Starting Setup ====="

# Clone ComfyUI setup repo
if [ ! -d "ComfyUI-setup" ]; then
  echo "Cloning ComfyUI-setup..."
  git clone https://github.com/RizwanSabir/ComfyUI-setup.git
else
  echo "ComfyUI-setup already exists."
fi

# Clone official ComfyUI repo
if [ ! -d "ComfyUI" ]; then
  echo "Cloning ComfyUI..."
  git clone https://github.com/Comfy-Org/ComfyUI.git
else
  echo "ComfyUI already exists."
fi

# Move into ComfyUI directory
cd ComfyUI

# Create virtual environment if not exists
if [ ! -d "venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv venv
else
  echo "Virtual environment already exists."
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Install code-server
echo "Installing code-server..."
curl -fsSL https://code-server.dev/install.sh | sh

# Start code-server
echo "Starting code-server..."
code-server

echo "===== Setup Complete ====="
