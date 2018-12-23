#!/bin/bash

readonly VAULT_VERSION='0.11.4'

function downloadVault {
    curl 'https://releases.hashicorp.com/vault/'$VAULT_VERSION'/vault_'$VAULT_VERSION'_linux_386.zip' > vault.zip
    ls
    unzip vault.zip
    chmod +x vault
    rm vault.zip
    mv vault /usr/local/bin
}

function launchVault {
    systemctl enable vault.service
    systemctl start  vault.service
}

function main {
    set -e
    set -x
    set -u
    set -C
    
    downloadVault
    launchVault
}

main
