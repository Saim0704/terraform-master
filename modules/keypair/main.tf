resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = var.key_name
  public_key = tls_private_key.generated.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content          = tls_private_key.generated.private_key_pem
  filename         = "${path.root}/keys/${var.key_name}.pem"
  file_permission  = "0600"
  depends_on       = [aws_key_pair.generated]
}