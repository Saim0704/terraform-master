# Key Pair
key_name = "jenkins-server-key"

# Security Group
sg_name        = "jenkins-sg"
sg_description = "Security group for jenkins access"
vpc_id         = "vpc-08994501439557c27"

# EC2 Instance
ami_id           = "ami-0e35ddab05955cf57"
instance_type    = "t2.micro" # use t3.micro instead of t2.micro to support UEFI boot
subnet_id        = "subnet-098751e5b3358bc56"
root_volume_size = 10
name             = "Jenkins-Server"

# EKS CLUSTER
cluster_name      = "demo-eks-cluster"
cluster_version   = "1.32"
# vpc_id            = Variable Available in SG
subnet_ids        = ["subnet-098751e5b3358bc56", "subnet-0190aa0be2ee7b2de"]
node_group_name   = "demo-deployment"
node_instance_type     = "t2.medium"
desired_capacity  = 2
min_capacity      = 1
max_capacity      = 2
node_disk_size    = 10
region            = "ap-south-1"