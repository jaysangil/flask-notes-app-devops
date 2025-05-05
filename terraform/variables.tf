variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    default = "us-east-1"
}

variable "instance_type" {
    default = t2.micro
}

variable "key_name" {
    description = "AWS key_name"
    default     = string
}

variable "my_ip" {
    description = "for ssh"
    default = string
}