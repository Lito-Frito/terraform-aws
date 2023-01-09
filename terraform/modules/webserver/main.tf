resource "aws_security_group" "myapp-sg" {
  vpc_id = var.vpc_id
  name = "myapp-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
    "Name" = "${var.env_prefix}-sg"
  }
}

data "aws_ami" "latest-amazon-linux-img" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = [var.image_name]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "server-key"
  public_key = file(var.public_key_location)
}

resource "aws_instance" "myapp-server" {
  # Required
  ami           = data.aws_ami.latest-amazon-linux-img.id
  instance_type = var.instance_type

  # Optional
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.myapp-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh-key.key_name

  tags = {
    "Name" = "${var.env_prefix}-server"
  }

  # Ensure that EC2 is replaced when script is updated
  user_data_replace_on_change = true

  # Script to execute
  user_data = file("./modules/webserver/entry-script.sh")
}

