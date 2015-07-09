#!/bin/sh

set -x

# Add necessary ppa's
ppas=$(cat ppas.txt)
for ppa in $ppas
do
    add-apt-repository $ppa --yes
done
# Run an update of a system
        apt-get update

# Upgrade system, if it is needed
        apt-get dist-upgrade --yes

# Install necessary packages
        apt-get install $(cat packages.txt) --yes

# Install Docker
        curl -sSL https://get.docker.com/ | sudo bash

# allow superuser access without password
        echo "`whoami` ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

exit 0
