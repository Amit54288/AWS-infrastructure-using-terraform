output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "asg_name" {
  value = aws_autoscaling_group.web_asg.name
}