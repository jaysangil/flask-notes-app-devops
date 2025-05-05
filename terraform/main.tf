resource "aws_security_group" "sg"{
    name = "flask-app-sg"
    description = "Allow SSH and flask port"


ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.my_ip]
}

ingress {
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
    cidr_blocks =["0.0.0.0/0"]
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks =["0.0.0.0/0"]
}

}

resource "aws_instance" "flask_ec2" {
    ami = "ami-0f88e80871fd81e91" # Amazon Linux 2 (us-east-1)
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data = file("${path.module}/user_data.sh")


tags = {
    Name = "FlaskNotesApp"
}
}