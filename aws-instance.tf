resource "aws_instance" "public_instance" {
  subnet_id     = aws_subnet.public-subnet-1.id
  instance_type = "t2.micro"
  ami           = "ami-0f5ee92e2d63afc18"
  key_name      = aws_key_pair.terraform.key_name

  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "public_instance"
  }
  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./id_rsa")
  }
  provisioner "file" {
    source      = "./id_rsa"       # terraform machine
    destination = "/home/ubuntu/id_rsa" # remote machine
  }
  provisioner "remote-exec" {
    inline = ["chmod 400 id_rsa"]

  }
}
resource "aws_instance" "private_instance" {
  subnet_id              = aws_subnet.private-subnet-1.id
  instance_type          = "t2.micro"
  ami                    = "ami-0f5ee92e2d63afc18"
  key_name               = aws_key_pair.terraform.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "private_instance"
  }
}