output "vpc_id" {
  value = aws_vpc.vpc_app.id
}
output "public_ip" {
  value = aws_instance.app_server.public_ip
}