resource "aws_autoscaling_group" "web_asg" {
  name                      = "terraform-web-asg"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  health_check_type         = "EC2"
  health_check_grace_period = 300

  vpc_zone_identifier = [
    aws_subnet.public_subnet.id
  ]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "terraform-asg-instance"
    propagate_at_launch = true
  }
}