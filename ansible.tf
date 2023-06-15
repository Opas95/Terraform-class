# Ansible master 
resource "aws_instance" "ansible-master" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.food-pub-sn.id
  key_name = greenkey
  vpc_security_groups_ids = [aws_security_group.allow_food.id]
  user_data = file("install-ansible")
  private_ip = 172.31.19.345

  tags = {
    Name = "Ansible master"
  }
}
