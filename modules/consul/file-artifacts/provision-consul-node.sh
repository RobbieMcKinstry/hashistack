#!/bin/bash

readonly CONSUL_VERSION='1.3.0'

function apt-get-install {
    sleep 30
    apt-get clean -qq
    sleep 10
    apt-get update -qq
    sleep 10
    apt-get install -f -yqq zip unzip
}

function downloadConsul {
    curl 'https://releases.hashicorp.com/consul/'$CONSUL_VERSION'/consul_'$CONSUL_VERSION'_linux_386.zip' > consul.zip
    ls
    unzip consul.zip
    chmod +x consul
    rm consul.zip
    mv consul /usr/local/bin
}

function setupConsulData {
    mkdir /consul-data
}

function launchConsul {
    systemctl enable consul.service
    systemctl start  consul.service
}

function main {
    set -e
    set -x
    set -u
    set -C
    
    apt-get-install
    setupConsulData
    downloadConsul
    launchConsul
}

main
