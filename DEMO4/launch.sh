#!/bin/bash
echo -e "\n!!!BE CAREFUL!!! THE SCRIPT MUST BE RUNNING FROM THE DIRECTORY IN WHICH IT'S LOCATED";
sleep 2;
cd terraform/
terraform apply
#vm_server to ansible hosts
cd ..

echo "" > ./ansible/hosts
for i in {1..3}
do
echo -e "[VM$i]\nvm$i ansible_host=$(aws ec2 describe-instances --filter Name=tag:Name,Values=VM$i --query 'Reservations[*].Instances[*].{I:PublicIpAddress}' --output text)\n" >> ./ansible/hosts;
done

#db and petclinic vars
echo -e "[all:vars]\ndb_server=$(aws ec2 describe-instances --filter Name=tag:Name,Values=VM3 --query 'Reservations[*].Instances[*].{I:PrivateIpAddress}' --output text)" >> ./ansible/hosts;
echo -e "petclinic_server=$(aws ec2 describe-instances --filter Name=tag:Name,Values=VM2 --query 'Reservations[*].Instances[*].{I:PrivateIpAddress}' --output text)" >> ./ansible/hosts;

cd ansible
for i in {30..1}
do
sleep 1
echo -e "\t$i"
done
ansible-playbook site.yml
