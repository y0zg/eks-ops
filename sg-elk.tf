#Logging Security Group
resource "aws_security_group" "log_sg" {
  name        = "log_sg"
  description = "Security group for log server"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all traffic to HTTP port 9200
  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow all traffic to HTTP port 5044
  ingress {
    from_port   = 5044
    to_port     = 5044
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all SSH External
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all traffic to HTTP port 9300
  ingress {
    from_port   = 9300
    to_port     = 9300
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all traffic to HTTP port 5601
  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
