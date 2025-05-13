output "cluster_name" {
  value = var.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_ca_certificate" {
  value = module.eks.cluster_certificate_authority_data
}

output "node_group_name" {
  value = var.node_group_name
}

output "kubeconfig" {
  description = "Raw kubeconfig content you can save to a file"
  value = yamlencode({
    apiVersion: "v1"
    kind: "Config"
    clusters: [
      {
        name: module.eks.cluster_name
        cluster: {
          server: module.eks.cluster_endpoint
          certificate-authority-data: module.eks.cluster_certificate_authority_data
        }
      }
    ]
    contexts: [
      {
        name: module.eks.cluster_name
        context: {
          cluster: module.eks.cluster_name
          user: "aws"
        }
      }
    ]
    current-context: module.eks.cluster_name
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
              module.eks.cluster_name
            ]
          }
        }
      }
    ]
  })
}