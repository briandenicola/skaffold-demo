#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "$(date)    post-create start" >> ~/status

# Install golang v18.4
#export VERSION=1.18.4
#curl -fsS https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz -o golang.tar.gz
#sudo tar -xvf golang.tar.gz
#sudo rm -rf /usr/local/go
#rm -rf /tmp/golang.tar.gz
#sudo mv go /usr/local/bin

# Install buildpacks
(curl -sSL "https://github.com/buildpacks/pack/releases/download/v0.27.0/pack-v0.27.0-linux.tgz" | sudo tar -C /usr/local/bin/ --no-same-owner -xzv pack)

# Install draft
curl -Lso draft https://github.com/Azure/draft/releases/download/v0.0.22/draft-linux-amd64
sudo install draft /usr/local/bin/
rm -rf ./draft

# Install skaffold
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
sudo install skaffold /usr/local/bin/
rm -rf ./skaffold 

# Update Kubelogin and kubectl
sudo az aks install-cli

# update the base docker images
docker pull bjd145/utils:3.9

echo "$(date)    post-create complete" >> ~/status
