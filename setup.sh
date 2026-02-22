#!/bin/bash

set -e  # Stop script if any command fails

echo "===== Starting Setup ====="

# 1️⃣ Clone your custom setup repo
if [ ! -d "ComfyUI-setup" ]; then
  echo "Cloning ComfyUI-setup..."
  git clone https://github.com/RizwanSabir/ComfyUI-setup.git
else
  echo "ComfyUI-setup already exists. Skipping..."
fi

# 2️⃣ Clone official ComfyUI repo
if [ ! -d "ComfyUI" ]; then
  echo "Cloning official ComfyUI..."
  git clone https://github.com/Comfy-Org/ComfyUI.git
else
  echo "ComfyUI already exists. Skipping..."
fi

# 3️⃣ Move into ComfyUI directory
cd ComfyUI

# 4️⃣ Install Python requirements
echo "Installing Python dependencies..."
pip install -r requirements.txt

# 5️⃣ Install code-server
echo "Installing code-server..."
curl -fsSL https://code-server.dev/install.sh | sh

# 6️⃣ Start code-server
echo "Starting code-server..."
code-server

echo "===== Setup Complete ====="
