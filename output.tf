output "primary_subnet_id" {
  value = "${aws_subnet.primary.id}"
  description = "Primary subnet ID"
}

output "secondary_subnet_id" {
  value = "${aws_subnet.secondary.id}"
  description = "Secondary subnet ID"
}

