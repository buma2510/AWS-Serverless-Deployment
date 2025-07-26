variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  default     = "greeting-api-key"
}
