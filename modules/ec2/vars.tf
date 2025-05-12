variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "key_name" {
  description = "Key pair name to connect to the instance"
  type        = string
}

variable "security_group_ids" {
  description = "SG IDs"
  type        = list(string)

}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GiB"
  type        = number
  default     = 8
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
}



