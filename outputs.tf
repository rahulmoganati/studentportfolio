output "portal_url" { value = "http://${aws_instance.portal.public_ip}" }
output "ec2_public_ip" { value = aws_instance.portal.public_ip }
output "rds_endpoint" { value = aws_db_instance.mysql.address }
output "database_name" { value = aws_db_instance.mysql.db_name }
output "database_password" { value = random_password.db.result, sensitive = true }
