# Student Portal Terraform starter

This creates a VPC, two public subnets, two private subnets, EC2, security groups, and private RDS MySQL in ap-south-1.

## Deploy
1. Install Terraform and configure AWS credentials (`aws configure`) on your trusted deployment machine.
2. Copy `terraform.tfvars.example` to `terraform.tfvars`, change the admin password and restrict `allowed_http_cidr` to your public IP/32.
3. Run `terraform init`, `terraform fmt -recursive`, `terraform validate`, `terraform plan`, `terraform apply`.
4. Visit `terraform output -raw portal_url`.

## Important
This is the infrastructure foundation, not yet the full portal deployment. EC2 currently serves a placeholder page. Your existing app uses SQLite; it must be changed to a MySQL provider and the app artifact deployed before student data will use RDS. This starter intentionally does not copy your existing source code from EC2 automatically. RDS is private and only allows connections from the EC2 security group. Terraform state contains the RDS password: never commit state or terraform.tfvars. The HTTP endpoint is demo-only; use HTTPS before production. Check AWS pricing before apply.
