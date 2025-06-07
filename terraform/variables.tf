variable "aws_region" {
    description = "AWS Region"
    default     = "us-east-1"
}

variable "instance_type" {
    default = t2.micro
}

variable "key_name" {
    description = "AWS key_name"
}

variable "my_ip" {
    description = "for ssh"
}