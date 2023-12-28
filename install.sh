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

install_vscode() {
    echo "================== Installing the best IDE to ever exist =============================="
    local download_url="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

    wget -O vscode.deb "$download_url"

    echo "======================= Successfully installed vscode stable version as vscode.deb"
}

install_postman() {
    echo "======================= Preparing postman ================================="
    sudo wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz

    echo "========================= Extracting postman ==========================="
    sudo tar -xvzf postman-linux-x64.tar.gz -C /opt

    echo "======================= Creating alias for postman =========================="
    sudo ln -s /opt/Postman/Postman /usr/bin/postman

    echo "===================== Postman has been installed, to run it open the terminal and enter postman=============================="
}

install_appimage_launcher() {
    echo "===================== Installing app image launcher ====================================="
    local appimagelauncher_url="https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb"

    echo "=========================== Installing app image launcher ========================================="
    wget -O appimage_laucher.deb "$download_url"

    echo "==================== Successfully installed App image launcher ================================"
}

install_telegram() {
    echo "============================ Installing Telegram desktop =================================="
    sudo apt update
    sudo apt install -y telegram-desktop
}

install_zoom() {

    echo "============================== Downloading Zoom ============================="
    local zoom_url="https://zoom.us/client/5.17.1.1840/zoom_amd64.deb"
    wget -O zoom.deb "$zoom_url"

    echo "========================= Installing Zoom ==================================="
    sudo apt install -y ./zoom.deb
}

install_obsidian() {
    local obsidian_url="https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/Obsidian-1.5.3.AppImage"
    echo "============================ Downloading Obsidian Notes ===================================="
    wget -O obsidian.AppImage "$obsidian_url"
    echo "================================== Successfully downloaded Obsidian run it on the UI to complete installation. =========================================="

}

# Calling all functions
install_flutter
install_brave
install_vscode
install_postman
install_appimage_launcher
install_telegram
install_zoom
install_obsidian