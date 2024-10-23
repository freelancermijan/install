#!/usr/bin/env bash

# Function to display usage message
display_usage() {
    echo "Usage:"
    echo "     $0 ins"
    echo ""
    echo "Options:"
    echo "  -h               Display this help message"
    echo "  -ins             Install all"
    echo "  -i               Check if required tools are installed"
    exit 0
}

# Check if help is requested
if [[ "$1" == "-h" ]]; then
    display_usage
    exit 0
fi

# Function to check installed tools
check_tools() {
    tools=("bsqli")

    echo "Checking required tools:"
    for tool in "${tools[@]}"; do
        if command -v "$tool" &> /dev/null; then
            echo "$tool is installed at $(which $tool)"
        else
            echo "$tool is NOT installed or not in the PATH"
        fi
    done
}

# Check if tool installation check is requested
if [[ "$1" == "-i" ]]; then
    check_tools
    exit 0
fi

# single site scan functionality


if [[ "$1" == "-set" ]]; then
    cd /opt/
    sudo git clone https://github.com/freelancermijan/bsqli.git
    cd bsqli/
    sudo chmod +x ./*.py
    cd
    sudo apt install dos2unix -y
    sudo dos2unix /opt/bsqli/bsqli.py
    sudo ln -sf /opt/bsqli/bsqli.py /usr/local/bin/bsqli
    bsqli -h
    exit 0
fi
