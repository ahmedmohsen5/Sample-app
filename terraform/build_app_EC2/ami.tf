# Define the AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

# Define the EC2 instance
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"  # You can change this to your desired instance type

  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.app_key_pair.key_name
  

  tags = {
    Name = "AppServer"
  }
}
