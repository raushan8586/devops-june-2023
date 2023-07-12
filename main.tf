terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.7.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "*****"
  secret_key = "******"
}

#create VPC
resource "aws_vpc" "intellipaat-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "intellipaat-vpc"
  }
}

#create subnets
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.intellipaat-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.intellipaat-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
  }
}

#create internet gateway
resource "aws_internet_gateway" "intellipaat-IGW" {
  vpc_id = aws_vpc.intellipaat-vpc.id

  tags = {
    Name = "intellipaat-IGW"
  }
}
