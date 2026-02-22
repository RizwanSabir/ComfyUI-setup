#!/bin/bash

set -e

echo "===== Starting Setup ====="

# ===============================
# Check Python Installation
# ===============================
if ! command -v python >/dev/null 2>&1; then
    echo "Python not found. Installing Python 3.11..."

    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository -y ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install -y python3.11 python3.11-venv python3.11-dev

    # Set Python 3.11 as default python
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1
    sudo update-alternatives --install /usr/bin/python3 python /usr/bin/python3.11 1

else
    echo "Python is already installed: $(python --version)"
fi


# ===============================
# Clone Repositories
# ===============================

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


# ===============================
# Setup ComfyUI Environment
# ===============================

cd ComfyUI

# Create virtual environment if not exists
if [ ! -d "venv" ]; then
  echo "Creating virtual environment..."
  python -m venv venv
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


echo "===== Setup Complete ====="
