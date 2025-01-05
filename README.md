# 1. Provision an EC2 Instance

Steps:

Install Terraform and configure your AWS CLI with credentials.

Create a Terraform configuration file (main.tf) with the following:

Provider: AWS

Resource: EC2 instance with the desired instance type and key pair.


# 2. Set Up a VPC with Subnets

Steps:

Define a custom VPC in your main.tf.

Create public and private subnets within the VPC.

Add an internet gateway and associate it with the VPC.

Define route tables and associate them with the subnets.

Apply the configuration with terraform apply.

# 3. Create an S3 Bucket with Versioning

Steps:

Define an S3 bucket resource in main.tf.

Enable versioning by adding the versioning block.

Apply the configuration and verify the bucket in the AWS Console.


# 4. Deploy a Simple Web App

Steps:

Define an EC2 instance in your Terraform configuration.

Use the user_data field to provide a script that installs a web server (e.g., Nginx) and deploys the app. Example:

Apply the Terraform script to create the instance and execute the user_data script.

Access the web app using the instance's public IP address in your browser.

# 5. Set Up a Multi-Region Deployment

Steps:

Define multiple providers for different AWS regions in main.tf.

Deploy resources (e.g., EC2 instances, S3 buckets) in each region.

Use Terraform modules to organize the code.

Verify resources in each AWS region.

