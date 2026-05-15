resource "aws_instance" "oregon_ec2" {
  ami           = "ami-04486bbfa25728941" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-oregon-ec2"
  }
}