#!/bin/bash

# 1) Clone your custom ComfyUI setup
echo "Cloning your ComfyUI setup..."
git clone https://github.com/RizwanSabir/ComfyUI-setup.git
if [ $? -ne 0 ]; then
  echo "Failed to clone ComfyUI-setup!"
  exit 1
fi

# 2) Clone the official ComfyUI repo
echo "Cloning official ComfyUI..."
git clone https://github.com/Comfy-Org/ComfyUI.git
if [ $? -ne 0 ]; then
  echo "Failed to clone ComfyUI!"
  exit 1
fi

# 3) Navigate into ComfyUI
cd ComfyUI || { echo "Failed to cd into ComfyUI"; exit 1; }

# 4) Install required Python packages
echo "Installing requirements..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
  echo "Failed to install requirements!"
  exit 1
fi

echo "Setup complete! 🎉"
