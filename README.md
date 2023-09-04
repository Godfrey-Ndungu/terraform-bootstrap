# terraform-bootstrap
Terraform plan for orchestrating the deployment of the infrastructure. The plan includes the setup of various AWS resources such as Virtual Private Cloud (VPC), subnets, Elastic Load Balancer (ELB), Amazon Elastic Container Service (ECS), Amazon RDS, Amazon S3, and Amazon CloudFront.

VPC and Subnets:
The plan creates a Virtual Private Cloud (VPC)  with a specified CIDR block ("10.0.0.0/16").
Two subnets are provisioned within the VPC with their respective CIDR blocks ("10.0.1.0/24" and "10.0.2.0/24").
Elastic Load Balancer (ELB):

An Elastic Load Balancer (ELB) is established to distribute incoming traffic across ECS instances.
Amazon Elastic Container Service (ECS):

An ECS cluster is configured to manage the containers for the Peach API.
Containers are hosted using AWS Fargate, allowing for simplified container management.
Amazon RDS (Relational Database Service):

An Amazon RDS instance is created to host the PostgreSQL database for the Peach API.
Automated backups are enabled to ensure data resilience with weekly backups.
Amazon S3 (Simple Storage Service):

Media files (such as images)  are stored in an S3 bucket
Proper access controls and permissions are configured to secure the S3 bucket.

Amazon CloudFront:
is set up to serve me? ia files stored in the S3 bucket.
CloudFront's content caching at edge locations is optimized to enhance content delivery speed.
Additional Considerations:
Security groups, IAM roles, and SSL/TLS configurations are implemented to bolster security.
Amazon CloudWatch is employed for monitoring the system's health, with alarms set up to alert on critical metrics.
