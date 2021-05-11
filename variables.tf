variable "index_message" {
	description = "This variable will be used to change the message of index.html"
	type = string
	default = "This is the default message of Variable"
}

variable "sec_name" {
        description = "This variable will be used to change the name of sec group"
        type = string
        default = "terraform-ap-secgrp"
}
