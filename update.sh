  GNU nano 8.4                                                                       update.sh                                                                                
!#/bin/bash

wget -O conduit-installer.deb https://gitlab.com/api/v4/projects/famedly%2Fconduit/jobs/artifacts/master/raw/aarch64-unknown-linux-musl.deb?job=artifacts
chmod +x conduit-installer.deb
sudo apt install -y ./conduit-installer.deb
