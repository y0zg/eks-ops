resource "aws_instance" "prometheus_server" {
  count = var.prometheus_server
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"
  key_name      = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.kandula_consul.id ,aws_security_group.monitor_sg.id]
  subnet_id = element(module.vpc.public_subnet_ids, count.index)
  associate_public_ip_address = true
  tags = {
    Name = "kandula-prometheus-server"
    consul_server = "false"
    prometheus_server = "true"
  }
}
