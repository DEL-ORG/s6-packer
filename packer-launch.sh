
 #!/bin/bash

# Check if Packer is installed
if command -v packer >/dev/null 2>&1; then
    echo "Packer is installed."
    packer --version # Display Packer version
else
    echo "Packer is not installed."
curl -fsSL https://apt.releases.hashicorp.com/gpg |  apt-key add -
 apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
 apt-get update &&  apt-get install packer
fi

read -p "Please enter AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
read -p "Please enter YOUR_SECRET_ACCESS_KEY: " YOUR_SECRET_ACCESS_KEY
read -p "Please enter AWS_DEFAULT_REGION: " AWS_DEFAULT_REGION


unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS
unset AWS_DEFAULT_REGION

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$YOUR_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION


packer init .
packer validate .
packer build .
