resource "aws_instance" "jenkins_slave" {
  count = 1
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"
  key_name      = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.kandula_consul.id]
  subnet_id = element(module.vpc.public_subnet_ids, count.index)
  associate_public_ip_address = true
  tags = {
    Name = "kandula-jenkins-slave"
    consul_server = "false"
    jenkins_slave = "true"
  }
}

resource "aws_instance" "jenkins_master" {
  count = 1
  ami           = lookup(var.ami, var.aws_region)
  instance_type = "t2.micro"
  key_name      = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.consul-join.name
  vpc_security_group_ids = [aws_security_group.kandula_consul.id]
  subnet_id = element(module.vpc.public_subnet_ids, count.index)
  associate_public_ip_address = true
  tags = {
    Name = "kandula-jenkins-master"
    consul_server = "false"
    jenkins_master = "true"
  }
}
