module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "hw-vpc"
}

module "subnets" {
  source        = "./modules/subnets"
  vpc_id        = module.vpc.vpc_id
  public_cidr   = "10.0.1.0/24"
  private_cidr  = "10.0.2.0/24"
  az            = "us-east-1a"
  name          = "hw-subnet"
}

module "ec2_public" {
  source               = "./modules/ec2"
  ami                  = "ami-09e6f87a47903347c"
  instance_type        = "t2.micro"
  subnet_id            = module.subnets.public_subnet_id
  associate_public_ip  = true
  name                 = "public-instance"
}

module "ec2_private" {
  source               = "./modules/ec2"
  ami                  = "ami-09e6f87a47903347c"
  instance_type        = "t2.micro"
  subnet_id            = module.subnets.private_subnet_id
  associate_public_ip  = false
  name                 = "private-instance"
}

import {
    to = aws_instance.hw-ec2
    id = "i-0a5bdf5b98826e22d"
}

resource "aws_instance" "hw-ec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0d31163f0b5b18ce8"
}