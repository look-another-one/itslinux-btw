#!/usr/bin/env bash
nix-shell -p python313Packages.desktop-notifier --run 'python3 ~/.Scripts/reminder-to-look-at-you/main.py'
