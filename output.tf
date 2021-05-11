output "app_ip" {
	value = aws_instance.aptf_instance.public_ip
	description = "The public IP of application server."
}
