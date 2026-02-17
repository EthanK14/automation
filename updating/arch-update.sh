#!/bin/bash

# Title: Automated Arch Linux Update Script

# Description: This script automates the process of updating an Arch Linux system. 
# It checks for updates, applies them, and handles any necessary cleanup.

sudo pacman -Syu --noconfirm

# Optional: Remove unused packages and clean up the package cache
sudo pacman -Rns $(pacman -Qtdq) --noconfirm
sudo pacman -Sc --noconfirm

