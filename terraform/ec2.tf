resource "aws_instance" "api_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = var.ec2_instance_type
  key_name      = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.api_sg.id]

  user_data = file("../scripts/ec2-setup.sh")

  tags = {
    Name = "GreetingAPI-Server"
  }
}

resource "aws_security_group" "api_sg" {
  name        = "greeting-api-sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
