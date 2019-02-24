output "primary_subnet_id" {
  value = "${aws_subnet.primary.id}"
}

output "secondary_subnet_id" {
  value = "${aws_subnet.secondary.id}"
}

