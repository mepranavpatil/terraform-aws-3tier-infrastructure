data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web1" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public-a.id

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "web-server-1"
  }
}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public-b.id

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "web-server-2"
  }
}