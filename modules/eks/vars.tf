variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS managed node group"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for EKS nodes"
  type        = string
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of worker nodes"
}

variable "min_capacity" {
  type        = number
  description = "Minimum number of worker nodes"
}

variable "max_capacity" {
  type        = number
  description = "Maximum number of worker nodes"
}

variable "node_disk_size" {
  type        = number
  description = "EBS volume size for each node (in GiB)"
}

variable "region" {
  type = string
  default = "ap-south-1"
}