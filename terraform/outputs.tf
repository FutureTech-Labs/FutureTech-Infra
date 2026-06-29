output "instance_id" {
  description = "Instance Id"
  value       = aws_instance.my_ec2.id
}

output "instance_name" {
  value = aws_instance.my_ec2.tags["Name"]
}

output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "public_dns" {
  value = aws_instance.my_ec2.public_dns
}

output "region" {
  value = var.region
}
