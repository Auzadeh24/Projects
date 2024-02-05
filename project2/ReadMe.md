# Project 2 Infrastructure Deployment
This Terraform script deploys a basic infrastructure for Project 2 using AWS resources. The infrastructure includes a VPC with 
public and private subnets, security groups, EC2 instances, a MySQL database, and a load balancer.

## Prerequisites
Before using this Terraform script, ensure you have the following:

1. Terraform installed on your machine.
2. AWS credentials configured with the necessary permissions.

## Usage
1. Clone this repository to your local machine.
2. git clone <repository-url>
3. cd <repository-directory>
4. Update the variables.tf file with your specific configurations, if needed.
5. Initialize the Terraform project.
6. terraform init
7. Review the changes that will be applied.
8. terraform plan
9. Apply the changes to create the infrastructure.
10. terraform apply -auto-approve
11. Once the deployment is complete, you can access the AWS Management Console to view the created resources.

## Clean-Up
To destroy the created infrastructure and release AWS resources:
1. terraform destroy -auto-approve
   
*"If you don't use -auto-approve, then you You will be prompted to confirm the apply/destroy and have to enter yes to proceed."*
