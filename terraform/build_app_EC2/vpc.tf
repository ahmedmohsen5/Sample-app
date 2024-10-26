resource "aws_vpc" "vpc_app" {
  cidr_block = "10.10.0.0/16"
  tags = {
    "Name" = "app" 
  }
  
}



