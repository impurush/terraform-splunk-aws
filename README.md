# terraform-splunk-aws
Using this branch, I have created an ec2 instance in AWS and installed the Splunk universal forwarder using terraform.

All the steps are performed in ec2.tf
1. Generated the key pair to access the aws.
2. Created an ec2 instance
3. Using remote-exec, download, untar and start the splunk universal forwarder in the created ec2 instance

Future steps
1. Install the splunk enterprise using the same steps.
2. Using local-exec to run the ansible-playbook to configure the splunk instance
