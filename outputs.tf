output "ec2_instance_id" {
  value = module.my_ec2.instance_id
}

output "ec2_public_ip" {
  value = module.my_ec2.public_ip
}

output "private_key_file_path" {
  value = module.key_name.private_key_path
}

# output "cluster_name" {
#   value = var.cluster_name
# }

# output "cluster_endpoint" {
#   value = module.eks_cluster.cluster_endpoint
# }

# output "cluster_ca_certificate" {
#   value = module.eks_cluster.cluster_ca_certificate
# }

# output "node_group_name" {
#   value = var.node_group_name
# }

output "kubeconfig" {
  description = "Raw kubeconfig content you can save to a file"
  value = yamlencode({
    apiVersion: "v1"
    kind: "Config"
    clusters: [
      {
        name: module.eks_cluster.cluster_name
        cluster: {
          server: module.eks_cluster.cluster_endpoint
          certificate-authority-data: module.eks_cluster.cluster_ca_certificate
        }
      }
    ]
    contexts: [
      {
        name: module.eks_cluster.cluster_name
        context: {
          cluster: module.eks_cluster.cluster_name
          user: "aws"
        }
      }
    ]
    current-context: module.eks_cluster.cluster_name
    users: [
      {
        name: "aws"
        user: {
          exec: {
            apiVersion: "client.authentication.k8s.io/v1beta1"
            command: "aws"
            args: [
              "eks",
              "get-token",
              "--region",
              var.region,
              "--cluster-name",
              module.eks_cluster.cluster_name
            ]
          }
        }
      }
    ]
  })
}