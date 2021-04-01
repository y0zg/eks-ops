resource "aws_instance" "elk_server" {
  count = var.elk_server
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t3.medium"
  key_name      = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.kandula_consul.id]
  subnet_id = element(module.vpc.public_subnet_ids, count.index)
  associate_public_ip_address = true
  tags = {
    Name = "kandula-elk-server"
    consul_server = "false"
    elk_server = "true"
  }
}