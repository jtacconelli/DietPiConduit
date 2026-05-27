#!/bin/bash

wget -O conduit-installer.deb https://gitlab.com/api/v4/projects/famedly%2Fconduit/jobs/artifacts/master/raw/aarch64-unknown-linux-musl.deb?job=artifacts
chmod +x conduit-installer.deb
sudo apt install -y ./conduit-installer.deb
sudo systemctl start matrix-conduit
sudo systemctl enable matrix-conduit
sudo systemctl status matrix-conduit
curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale serve reset
sudo tailscale funnel reset
sudo tailscale up
read -p "Would you like to install this in tailscale private mode? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Installing in Tailscale private mode..."
    tailscale serve --bg --https=443 http://localhost:6167
else
    echo "Installing in public mode..."
    tailscale funnel --bg --https=443 / http://127.0.0.1:6167
fi
