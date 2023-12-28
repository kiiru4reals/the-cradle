#!/bin/bash

# flutter
install_flutter() {
    # Clone flutter repository
    git clone https://github.com/flutter/flutter.git -b master

    # Add PATH to .bashrc
    echo 'export PATH="$PATH:$HOME/flutter/flutter/bin"' >> $HOME/.bashrc

    # Refresh the rc file
    source $HOME/.bashrc

    echo "================== Confirming if the flutter directory exists in PATH ==============================="
    echo $PATH

    echo "============================== Checking if we can use the flutter command =========================="
    which flutter

    echo "========================== Downloading pre-development binaries ==============================="
    flutter precache

    echo "Flutter SDK installation complete. Run 'flutter doctor' to install the rest."
}

# Brave browser
install_brave() {
    # install curl
    echo "===================== Installing curl =================="
    sudo apt -y install curl
    
    echo "================== Downloading keyring ====================="
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "=========================== Adding Brave Browser to sources.list.d ============================="

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    echo "================================ Updating packages ==============================="
    sudo apt update

    echo "==================== Installing brave =========================="

    sudo apt install brave-browser

}

install_vs_code() {
    echo "================== Installing the best IDE to ever exist =============================="
    local download_url="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

    wget -O vscode.deb "$download_url"

    echo "======================= Successfully installed vscode stable version as vscode.deb"
}
