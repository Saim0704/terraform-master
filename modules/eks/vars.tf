variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
# variable "private_subnet_ids" {
#   type = list(string)
# }
variable "node_instance_type" {}
variable "desired_capacity" {}
# variable "public_key_path" {}
variable "max_size" {}
variable "min_size" {}
variable "region" {
    type = string
    default = "ap-south-1"
}
# variable "ec2_ssh_key" {}