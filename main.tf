provider "aws" {
 version = "~> 2.0"
 access_key= "AKIAJTYU4CMZXBFLD7OA"
 secret_key= "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" 
 region = "us-east-1"
}

resource "aws_vpc" "My_VPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default" 
  enable_dns_support   = "true" 
  enable_dns_hostnames = "true" 
 
}
