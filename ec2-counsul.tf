resource "aws_instance" "consul_server" {
  count = var.consul_server
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"
  key_name      = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.kandula_consul.id]
  subnet_id = element(module.vpc.public_subnet_ids, count.index)
  associate_public_ip_address = true
  tags = {
    Name = "kandula-consul-serves-${count.index}"
    consul_server = "true"
  }
}
