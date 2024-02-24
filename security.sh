#!/bin/bash

# Recon



# Social engineering

# Wireless scanning


# Mobile security

# GraphQL security
install_clairvoyance () {
    local clairvoyance_url="https://github.com/nikitastupin/clairvoyance.git"
    echo "====================== Cloning clairvoyance ======================"
    git clone "$clairvoyance_url"
}

install_inql() {
    local inql_url="https://github.com/doyensec/inql.git"
    echo "======================== Cloning inql ==============================="
    git clone "$inql_url"
}

install_graphw00f() {
    local graphw00f_url="https://github.com/dolevf/graphw00f.git"
    echo "================================ Cloning graphw00f ==========================="
    git clone "$graphw00f_url"
}

install_batchql() {
    local batchql_url="https://github.com/assetnote/batchql.git"
    echo "====================== Cloning batchql =============================="
    git clone "$batchql_url"
}

install_graphql_path_enum() {
    local graphql_path_enum_url="https://gitlab.com/dee-see/graphql-path-enum/-/jobs/artifacts/v1.1/raw/target/release/graphql-path-enum?job=build-linux"
    echo "===================================== Installing graphql-path-enum ========================================="
    wget -O graphql-path-enum "$graphql_path_enum_url"
    echo "===================================== Setting relevant permissions ============================================="
    sudo chmod u+x graphql-path-enum
}

install_graphql_cop () {
    local graphql_cop_url="https://github.com/dolevf/graphql-cop.git"
    echo "========================= Cloning GraphQL cop ====================================="
    git clone "$graphql_cop_url"
    echo "========================================= Navigating into graql-cop directory ====================================="
    cd graphql-cop
    pip install -r requirements.txt
    cd ..
    echo "========================================= Navigating back to root folder ==============================================="
}

install_crackql () {
    local crackql_url="https://github.com/nicholasaleks/CrackQL.git"
    echo "================================ Cloning crackql ======================================="
    git clone "$crackql_url"
    echo "================================ Navigating to crackQL repository =================================="
    cd CrackQL
    echo "================================ Installing CrackQL requirements ===================================="
    pip install -r requirements.txt
    echo "================================ Navigating to root directory ========================================"

}
# Calling all functions
install_clairvoyance
install_inql
install_graphw00f
install_batchql
install_graphql_path_enum
install_graphql_cop
install_crackql