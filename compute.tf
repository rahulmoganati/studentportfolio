data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter { name = "name", values = ["ubuntu/images/hvm-ssd/ubuntu-noble-24.04-amd64-server-*"] }
  filter { name = "architecture", values = ["x86_64"] }
}
resource "aws_instance" "portal" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  subnet_id = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  associate_public_ip_address = true
  user_data = <<-USERDATA
    #!/bin/bash
    set -eux
    apt-get update
    apt-get install -y nginx dotnet-sdk-10.0
    systemctl enable --now nginx
    cat >/var/www/html/index.html <<'HTML'
    <h1>Student Portal infrastructure is deployed</h1>
    <p>Next: upload and deploy the .NET application and configure its MySQL repository.</p>
    HTML
  USERDATA
  tags = { Name = "${var.project_name}-ec2" }
}
