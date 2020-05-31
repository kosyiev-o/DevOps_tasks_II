# Tasks for Demo 1

- [Practice after Training 1 AWS](#Practice-after-Training-1-AWS)
- [Practice after Training 2 AWS](#Practice-after-Training-2-AWS)
- [Practice after Training 3 AWS](#Practice-after-Training-3-AWS)
- [Practice after Training 1 Terraform](#Practice-after-Training-1-Terraform)
- [Practice after Training 2 Terraform](#Practice-after-Training-2-Terraform)
- [Demo Session Requirements](#Demo-Session-Requirements)

Below you will find a list of tasks to play with after each lecture as well as the list of requirements for the demo.

## Practice after Training 1 AWS

- Create IAM user (non-root) for UI console access with full/admin rights.
- Create IAM user for CLI access with admin rights and access keys (without web access to console).
- Install and configure AWS CLI on your laptop.
- Create VPC in us-west-2 (Oregon) region (not a default VPC).
- Create 1 private subnet and 1 public subnet with any valid CIDR in VPC created in step 3.
- Create NAT gateway and internet gateway.
- Create and configure route tables for subnets.
- Create Security Group to allow traffic from everywhere to ports 80 and 22 as inbound and allow all everywhere outbound.
- Create EC2 instance in public subnet, SSH to that instance.
- Add tag "Name=Bastion" to this instance with AWS CLI.

## Practice after Training 2 AWS

- Install and run Apache on the instance created earlier.
- Verify that Apache works from outside AWS by http://<Public IP>:80 in your browser. Use SG created earlier. 
- Create RDS MySQL instance in private subnet.
- Install MySQL client on the 'Bastion' instance and establish connection from your EC2 instance to the RDS instance.

## Practice after Training 3 AWS

- Create S3 bucket. Upload a shell script 'startup.sh' that installs MySQL client, AWS CLI, and Apache to this bucket.
- Create custom IAM role that grants read access from this S3 bucket.
- Create Launch Configuration that contains userdata to get script startup.sh from S3.
- Create ASG with at least one instance in private subnet using Launch Configuration.
- Ensure that this instance has network level access to RDS instance (SG).
- Create tag 'Application' for this instance with AWS CLI.
- Create ALB in public subnet for the 'Application' instance in private subnet.

## Practice after Training 1 Terraform

*Use Terraform to create new resouces*

- Work in folder DEMO1 of your repo. Create Terraform scripts there.
- Ensure that S3 bucket created earlier already contains shell script 'startup.sh' that installs MySQL client, AWS CLI, and Apache.
- Create another custom IAM role that grants read access from this S3 bucket.
- Create Launch Configuration that contains userdata to get script startup.sh from S3.
- Create ASG with at least one instance in private subnet using Launch Configuration.
- Add tag 'Name=Apache' to this instance.

## Practice Training 2 Terraform

*Use Terraform to create new resouces*

- Work in folder DEMO1 of your repo. Create Terraform scripts there.
- Create ALB in public subnet with target group that is pointing to ASG created previously. 
- Create three security groups: one between ALB and ASG, one from internet to ALB, and one between EC2 and RDS instance created manually. 
- Check that instance from your ASG can connect to RDS instance.

## Demo Session Requirements

1. Show network layer created manually.
2. Show AWS CLI command for adding a tag to an instance.
3. Show instance configured as Bastion host, explain its configuration.
3. Show S3 bucket that contains shell script startup.sh to install MySQL client, AWS CLI, and Apache.
4. Show RDS MySQL instance. 
5. Show Terraform script in folder DEMO1 of your repo. This script should have ALB in public subnet with target group that is pointing to ASG. Show three security groups created for this task: one between ALB and ASG, one from internet to ALB, and one between EC2 and RDS. Show IAM role attached to EC2 that allows S3 get objects from the S3 bucket created in step 3. ASG should be created from Launch Configuration that contains userdata to get script startup.sh from S3.
6. Show that your instance 'Apache' has connection to RDS. Use MySQL client for this.
