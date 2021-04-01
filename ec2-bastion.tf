##########################################
### Bastion ###
##########################################

# resource "aws_instance" "bastion" {
# count = var.bastion_server
# ami = lookup(var.ami, var.aws_region)
# instance_type = "t2.micro"
# key_name = var.key_name
# subnet_id = element(module.vpc.public_subnet_ids, count.index )
# associate_public_ip_address = true
# iam_instance_profile   = aws_iam_instance_profile.consul-join.name
# vpc_security_group_ids = [aws_security_group.bastion.id]
# tags = {
# Name = "kandula-bastion"
# consul_server = "false"
# }

# }
