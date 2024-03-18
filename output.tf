

output "ssh-command" {
  value = "ssh -i utc-key.pem ec2-user@${aws_instance.vpcInstance.public_dns}"
}

output "public-ip" {
  value = aws_instance.vpcInstance
}
