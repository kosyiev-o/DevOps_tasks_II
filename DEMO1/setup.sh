#! /bin/bash
sudo apt-get update
sudo apt-get install -y awscli
aws s3 cp s3://demo1.devopscamp/setup.sh .
chmod +x setup.sh
./setup.sh

