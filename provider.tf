provider "aws" {
  profile = "imperva"
  region     = var.aws_region
}


terraform {
  required_version = "0.14.1"
 # backend "s3" {
 #   bucket         = "tf-us-east-2-state"
 #   key            = "global/s3/terraform.tfstate"
 #   region         = "us-east-2"
 #   encrypt        = true
 # }
}

variable "kubernetes_version" {
  default = 1.18
  description = "kubernetes version"
}
