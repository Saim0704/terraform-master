# output "ec2_instance_id" {
#   value = module.my_ec2.instance_id
# }

output "ec2_public_ip" {
  value = module.my_ec2.public_ip
}

output "private_key_file_path" {
  value = module.key_name.private_key_path
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
# output "kubeconfig" {
#   value = module.eks.kubeconfig
# }