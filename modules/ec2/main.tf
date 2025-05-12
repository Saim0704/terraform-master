resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = var.security_group_ids

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }
  tags = {
    Name = var.name
  }
}