output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "kubeconfig" {
  value = <<EOT
aws eks update-kubeconfig --name ${aws_eks_cluster.this.name} --region ${var.region}
EOT
}