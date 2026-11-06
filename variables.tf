variable "aws_region" { type = string, default = "ap-south-1" }
variable "project_name" { type = string, default = "student-portal" }
variable "allowed_http_cidr" {
  type = string
  description = "Restrict to your public IP/32 where possible."
  default = "0.0.0.0/0"
}
variable "admin_password" { type = string, sensitive = true }
variable "ec2_instance_type" { type = string, default = "t3.micro" }
variable "db_instance_class" { type = string, default = "db.t3.micro" }
