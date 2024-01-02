#!/bin/bash

# Recon



# Social engineering

# Wireless scanning


# Mobile security

# GraphQL security
install_altair (){
    local altair_url="https://github.com/altair-graphql/altair/releases/download/v6.1.0/altair_6.1.0_x86_64_linux.AppImage"
    wget -O altair_6_1_0.AppImage "$altair_url"
    sudo chmod u+x altair_6_1_0.AppImage
    ./altair_6_1_0.AppImage
}

# Calling all functions
install_altair