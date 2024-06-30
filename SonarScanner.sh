#!/bin/bash

# Define Sonar Scanner version
SONAR_SCANNER_VERSION=5.0.1.3006

# Change to /tmp directory
cd /tmp || exit

# Download Sonar Scanner
echo "Downloading sonar-scanner....."
if [ -f "sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip" ]; then
    rm "sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip"
fi
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip
echo "Download completed."

# Unzip downloaded file
echo "Unzipping downloaded file..."
unzip -o "sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip"
echo "Unzip completed."
rm "sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip"

# Install to /opt
echo "Installing to /opt..."
if [ -d "/var/opt/sonar-scanner-$SONAR_SCANNER_VERSION-linux" ]; then
    sudo rm -rf "/var/opt/sonar-scanner-$SONAR_SCANNER_VERSION-linux"
fi
sudo mv "sonar-scanner-$SONAR_SCANNER_VERSION-linux" /var/opt
echo "Installation completed successfully."

# Adding Sonar Scanner to PATH
if ! grep -q "/var/opt/sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin" ~/.bashrc; then
    echo 'export PATH=$PATH:/var/opt/sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin' >> ~/.bashrc
    source ~/.bashrc
fi

echo "Sonar Scanner installation is complete and added to PATH."
