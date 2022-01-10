# hyperledger-composer

Simple network to track the movement of Tuna fish. The network will maintain a single system where fishers, restaurant owners and regulators interact.

![composer_playground](images/composer_playground.png?raw=true)

## Install Pre-Requisites

Hyperledger composer requires Node JS & Docker to be available. Run below script in your linux (or) WSL if the required dependencies are not available.

```
curl -O https://hyperledger.github.io/composer/latest/prereqs-ubuntu.sh
chmod u+x prereqs-ubuntu.sh
./prereqs-ubuntu.sh
```

## Install Hyperledger Composer Components

```
# Install the Composer Command Line Interface
npm install -g composer-cli

# Install the Composer REST Server
npm install -g composer-rest-server

# Install Composer Playground
npm install -g  composer-playground

# Install Yeoman
npm install -g yo

# Install the Hyperledger Composer generator for Yeoman
npm install -g generator-hyperledger-composer
```

## Install Hyperledger Fabric Development Server

```
mkdir ~/fabric-tools && cd ~/fabric-tools

curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.zip

unzip fabric-dev-servers.zip

# Donwload docker images
./downloadFabric.sh
```

If you are a Windows user using WSL (Windows subsytem for linux) instead of Virtualbox with Ubuntu VM:

1. Ensure you have set a mount path to your local drive. Otherwise, you will face volume mount issues when running the containers.

This can be done by updating your wsl.conf with below content:

```
[automount]
root = /
options = "metadata"
```

2. Extract `fabric-dev-servers.zip` in your windows user directory /c/Users/YOUR_WINDOWS_USERNAME/

## Start Hyperledger Fabric and Composer Playground

```
# start the Docker images that comprise the Hyperledger Fabric network
./startFabric.sh

# Create a Hyperledger Fabric peer administrator identity for your networks
./createPeerAdminCard.sh

# Start the Composer Playground, which will run on port 8080
composer-playground
```

## Create Empty Network

Use Yeoman to create an empty network, by running:

```
yo hyperledger-composer:businessnetwork

? Business network name: tuna-network
? Description: Hyperledger Composer network for Tuna tracking
? Author name:  
? Author email: 
? License: 
? Namespace: org.tuna
? Do you want to generate an empty template network? Yes: generate an empty template network
```

## Create Business Network Archive

Run below command in the project directory to create .bna file

```
composer archive create -t dir -n .
```

## Deploy onto Hyperledger Fabric

```
# install the network onto the Hyperledger Fabric peers
composer network install --card PeerAdmin@hlfv1 --archiveFile tuna-network@0.0.1.bna

# initialize the chaincode on the Hyperledger Fabric peers
composer network start --card PeerAdmin@hlfv1 --networkAdmin admin --networkAdminEnrollSecret adminpw --networkName tuna-network --networkVersion 0.0.1

# create a card that you can import
composer card import --file admin@tuna-network.card

access the business network
composer network ping --card admin@tuna-network
```

You can now add participants, create assets and perform transactions using the playground.

![tuna_network](images/tuna_network.png?raw=true)

## Run Composer REST server

```
composer-rest-server -c admin@tuna-network -n never -w true
```