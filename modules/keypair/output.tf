output "key_name" {
  value = aws_key_pair.generated.key_name
}

output "public_key" {
  value = tls_private_key.generated.public_key_openssh
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}

# output "public_key_content" {
#   value = file("${path.root}/keys/${var.key_name}.pem")
# }