provider "aws" {
 version = "~> 2.0"
 access_key= "AKIAI4QDMHTYPRETTPGQ"
 secret_key= "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" 
 region = "us-east-1"
}

resource "aws_vpc" "My_VPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default" 
  enable_dns_support   = "true" 
  enable_dns_hostnames = "true" 
 
}
