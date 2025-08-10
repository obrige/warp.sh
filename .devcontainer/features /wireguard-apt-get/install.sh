#!/bin/bash
set -e

echo "Installing WireGuard using apt-get..."

sudo apt-get update
sudo apt-get install -y wireguard
