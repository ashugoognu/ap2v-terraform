resource "aws_instance" "aptf_instance" {
	ami = "ami-0d758c1134823146a"
	instance_type = "t2.micro"
	vpc_security_group_ids = [aws_security_group.instance.id]
	key_name = "apdevops"

	user_data = <<-EOF
	#!/bin/bash
	sudo apt-get update
	apt-get install apache2 -y
	sudo systecmctl restart apache2
	echo "${var.index_message}" | sudo tee /var/www/html/index.html
EOF

	tags = {
		Name = "ap-terraform-session"
	}
}

resource "aws_security_group" "instance" {
	name = "${var.sec_name}-version2"

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

}
