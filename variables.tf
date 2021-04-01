variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "ami" {
  description = "ami (ubuntu 18) to use - based on region"
  default = {
    "us-east-1" = "ami-00ddb0e5626798373"
    "us-east-2" = "ami-0dd9f0e7df0f0a138"
  }
}

variable "key_name" {
  default = "max_imperva"
  type = string
}



variable "instance_type" {
  description = "The type of the ec2, for example - t2.micro"
  type        = string
  default     = "t2.micro"
}


variable "consul_server" {
  description = " number of needed instances to build "
  type        = string
  default     = 3
}
variable "elk_server" {
  description = " number of needed elk servers to build "
  type        = string
  default     = 1
}
variable "mysql_server" {
  description = " number of needed mysql  servers to build "
  type        = string
  default     = 1
}

variable "jenkins_server" {
  description = " number of needed jenkins servers to build "
  type        = string
  default     = 1
}
variable "jenkins_agent" {
  description = " number of needed jenkins agents to build "
  type        = string
  default     = 1
}
variable "prometheus_server" {
  type        = string
  default = 1
}

variable "bastion_server" {
  type        = string
  default = 1
}
locals {
  k8s_service_account_namespace = "default"
  k8s_service_account_name      = "opsschool-sa"
}

