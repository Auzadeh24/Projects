terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# VPC section
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "Project 2 VPC"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Project 2 IGW"
  }
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

#public Subnet
resource "aws_subnet" "project2_public_us_east_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Project2 Public Subnet"
  }
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.project2_public_us_east_1a.id
  route_table_id = aws_route_table.public_rtb.id
}

# Security group section

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH to VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# EC2 section
resource "aws_instance" "app" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.project2_public_us_east_1a.id
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]

  key_name = "as-key2"

  tags = {
    Name = "Project2 Azadeh public Instance"
  }
}

#Private Subnet
resource "aws_subnet" "project2_private_us_east_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Project2private Subnet"
  }
}

resource "aws_instance" "private-app" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.project2_private_us_east_1b.id
  associate_public_ip_address = "true"


  key_name = "as-key2"

  tags = {
    Name = "Project2 Azadeh private Instance"
  }
}

#Launch template
resource "aws_launch_template" "launch_template" {
  name = "Launch_template"

  block_device_mappings {
    device_name = "/dev/sdf"
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }


  instance_type = "t2.micro"

  key_name = "as-key2"


  network_interfaces {
    associate_public_ip_address = true
  }

  placement {
    availability_zone = "us-east-1b"
  }


  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Project 2 ec2 template"
    }
  }

}

resource "aws_launch_configuration" "l_config" {
  name                        = "project2_l_config"
  image_id                    = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "as-key"
  security_groups             = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
}

#Load balancer
resource "aws_lb" "load_balancer" {
  name               = "project2-application-lb"
  internal           = false
  load_balancer_type = "application"
  subnets = [
    aws_subnet.project2_public_us_east_1a.id,
    aws_subnet.project2_private_us_east_1b.id,
  ]
  security_groups = [aws_security_group.allow_ssh.id]
}

resource "aws_placement_group" "project2_apg" {
  name     = "project2-apg"
  strategy = "cluster"
}

#Autoscaling
resource "aws_autoscaling_group" "project2_asg" {
  name             = "project2_asg"
  min_size         = 1
  desired_capacity = 2
  max_size         = 4

  health_check_type = "ELB"
  load_balancers = [
    aws_lb.load_balancer.id
  ]
  launch_configuration = aws_autoscaling_group.project2_asg.aws_launch_configuration.l_config
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  vpc_zone_identifier = [
    aws_subnet.project2_public_us_east_1a.id,
    aws_subnet.project2_private_us_east_1b.id
  ]

  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = true
  }
}
