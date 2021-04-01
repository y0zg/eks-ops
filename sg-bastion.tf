resource "aws_security_group" "bastion" {
    name = "bastion"
    description = "bastion to connect private servers"
    vpc_id = module.vpc.vpc_id

    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["80.179.69.192/26"]
    }

    ingress  {
        from_port = 1194
        to_port = 1194
        protocol = "UDP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
    }

}