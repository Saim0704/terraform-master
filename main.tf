provider "aws" {
  region = "ap-south-1"
}

module "key_name"{
    source = "./modules/keypair"
    key_name = var.key_name
}

module "securitygroup" {
  source = "./modules/sg"
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress_rules = [
    {
      description      = "Allow HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
    },
    {
      description      = "Allow Jenkins"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
    },
    {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
    }
  ]
  egress_rules = [
    {
      description      = "Allow all outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
  tags = {
    Name = var.sg_name
  }
}

module "my_ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id # Replace with your region's AMI
  instance_type = var.instance_type
  subnet_id     = var.subnet_id      # Replace with your subnet ID
  key_name      = var.key_name          # Replace with your key pair name
  security_group_ids = [module.securitygroup.security_group_id]
  root_volume_size = var.root_volume_size
  name          = var.name
}

module "eks_cluster" {
  source           = "./modules/eks"
  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version
  vpc_id           = var.vpc_id
  subnet_ids       = var.subnet_ids
  node_group_name  = var.node_group_name
  instance_type    = var.node_instance_type
  desired_capacity = var.desired_capacity
  min_capacity     = var.min_capacity
  max_capacity     = var.max_capacity
  node_disk_size   = var.node_disk_size
}