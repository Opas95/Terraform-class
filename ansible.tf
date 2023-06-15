# Ansible master 
resource "aws_instance" "ansible-master" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.food-pub-sn.id
  key_name = "greenkey"
  vpc_security_group_ids = [aws_security_group.allow_food.id]
  user_data = file("install-ansible.sh")
  private_ip = "10.0.1.20"

  tags = {
    Name = "Ansible master"
  }
}
