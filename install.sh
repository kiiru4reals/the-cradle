#!/bin/bash


# Clone flutter repository
git clone https://github.com/flutter/flutter.git -b master

# Add PATH to .bashrc
echo 'export PATH="$PATH:$HOME/flutter/flutter/bin"' >> $HOME/.bashrc

# Refresh the rc file
source .bashrc

echo "================== Confirming if the flutter directory exists in PATH ==============================="
echo $PATH

echo "============================== Checking if we can use the flutter command =========================="
which flutter

echo "========================== Downloading pre-development binaries ==============================="
flutter precache

echo "Flutter SDK installation complete run flutter doctor to install the rest."