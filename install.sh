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

    sudo apt install -y brave-browser

}

install_vscode() {
    echo "================== Downloading the best IDE to ever exist =============================="
    local download_url="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

    wget -O vscode.deb "$download_url"

    echo "======================= Installing vscode =================================="
    sudo apt install -y ./vscode.deb
    echo "======================= Successfully installed vscode stable version as vscode.deb"
}

install_postman() {
    echo "======================= Preparing postman ================================="
    sudo wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz

    echo "========================= Extracting postman ==========================="
    sudo tar -xvzf postman-linux-x64.tar.gz -C /opt

    echo "======================= Creating alias for postman =========================="
    sudo ln -s /opt/Postman/Postman /usr/bin/postman

    echo "===================== Postman has been installed, to run it open the terminal and type postman =============================="
}

install_appimage_launcher() {
    echo "===================== Installing app image launcher ====================================="
    local appimagelauncher_url="https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb"

    echo "=========================== Downloading app image launcher ========================================="
    wget -O appimage_laucher.deb "$appimagelauncher_url"

    echo "========================== Installing app image launcher =================================="
    sudo apt install -y ./appimage_launcher.deb

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

install_fvm() {
    echo "============================= Setting up fvm ==========================================="
    echo "============================= Assumption: User has no homebrew installed =============================================="
    echo "============================= Installing homebrew ========================================================="
    sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "============================= Installing fvm =============================================="
    brew tap leoafarias/fvm
    brew install fvm
}

install_docker() {
    echo "========================= Initializing the docker installation process ======================================"
    sudo apt install -y docker.io
    echo "========================= Enabling the docker service ====================================================="
    sudo systemctl enable docker --now
    echo "Adding current user to the docker group ================================================"
    sudo usermod -aG docker $USER
    echo "============================ Installing docker-ce ======================================"
    printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list
    echo "=============================== Importing the gpg key ====================================="
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg
    echo "========================= Updating repositories ========================================"
    sudo apt -y update
    echo "================================= Installing docker-ce ================================="
    sudo apt install -y docker-ce docker-ce-cli containerd.io
}

install_docker_desktop () {
    local docker_desktop_url="https://desktop.docker.com/linux/main/amd64/docker-desktop-4.26.1-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"
    echo "=========================== Downloading docker desktop ============================================="
    wget -O docker-desktop.deb "$docker_desktop_url"
    echo "=========================== Installing docker desktop =============================================="
    sudo apt install ./docker-desktop.deb

}


install_altair (){
    local altair_url="https://github.com/altair-graphql/altair/releases/download/v6.1.0/altair_6.1.0_x86_64_linux.AppImage"
    wget -O altair_6_1_0.AppImage "$altair_url"
    sudo chmod u+x altair_6_1_0.AppImage
    ./altair_6_1_0.AppImage
}

# Install spotify
install_spotify(){
    curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update
    sudo apt install spotify-client
}

install_terminator(){
    sudo apt install -y terminator
}

# Calling all functions
#install_flutter
install_brave
install_vscode
install_postman
install_appimage_launcher
install_telegram
install_zoom
install_obsidian
#install_fvm
install_docker
install_docker_desktop
install_tilix
install_altair
install_spotify
install_terminator
