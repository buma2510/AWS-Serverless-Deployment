#!/bin/bash

# Update system
yum update -y

# Install Python and pip
yum install -y python3 python3-pip

# Install AWS CLI
pip3 install awscli --upgrade
