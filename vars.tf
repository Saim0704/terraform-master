##################################  KEY PAIR #####################

variable "key_name" {
  description = "Key pair name to connect to the instance"
  type        = string
  default = "demo_key"
}


################################## SECURITY GROUP #####################

variable "sg_name" {
  description = "Security Group Name"
  type        = string
  default     = "Default SG Name"
}

variable "vpc_id" {
  description = "VPD ID"
  type        = string
  default = "vpc-08994501439557c27"
}

variable "sg_description" {
  description = "Security Group Description"
  type        = string
  default = "Default Value"
}


################################## EC2 INSTANCE #####################

variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
  default = "ami-0e35ddab05955cf57"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
  default = "subnet-098751e5b3358bc56"
}

# variable "security_group_ids" {
#   description = "SG IDs"
#   type        = list(string)
# }

variable "root_volume_size" {
  description = "Size of the root EBS volume in GiB"
  type        = number
  default     = 8
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
}

################################## EKS CLUSTER #####################

variable "cluster_name" {}

variable "cluster_version" {
  default = "1.29"
}

# variable "vpc_id" {}

variable "subnet_ids" {
  type = list(string)
}

variable "node_group_name" {}

variable "node_instance_type" {
  default = "t2.large"
}

variable "desired_capacity" {
  default = 2
}

variable "min_capacity" {
  default = 1
}

variable "max_capacity" {
  default = 2
}

variable "node_disk_size" {
  default = 20
}

variable "region" {
  description = "Cluster Region"
  type = string
  default = "ap-south-1"  
}