resource "aws_launch_template" "web_lt" {
  name_prefix   = "terraform-web-lt-"
  image_id      = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "terraform-asg-instance"
    }
  }
}