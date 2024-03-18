
#create ec2 instances 

resource "aws_instance" "vpcInstance" {
 ami                    = "ami-06a0cd9728546d178"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1a.id
  key_name               = aws_key_pair.ec2_key.key_name
  security_groups        = [aws_security_group.webserver_sg.id]
  associate_public_ip_address = true

  user_data              = file("install.sh")
 ### my ami "ami-05175dea2854f77b1"

  tags = {
        Name: "utc-dev-inst"
        Team: "Cloud Transformation"
        Environment: "electrical"
        Created_by: "Gilbertken"
}
}


