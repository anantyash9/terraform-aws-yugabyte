#########################################################
#
# Outputs for the YugaByte terraform module.
#
#########################################################

output "master-ui" {
  sensitive = false
  value     = "http://${aws_instance.yugabyte_nodes.*.public_ip[0]}:7000"
}

output "tserver-ui" {
  sensitive = false
  value     = "http://${aws_instance.yugabyte_nodes.*.public_ip[0]}:9000"
}


output "public_ips" {
  sensitive = false
  value     = "${aws_instance.yugabyte_nodes.*.public_ip}"
}

output "private_ips" {
  sensitive = false
  value     = "${aws_instance.yugabyte_nodes.*.private_ip}"
}

output "security_group" {
  sensitive = false
  value     = "${aws_security_group.yugabyte.id}"
}

output "ssh_user" {
  sensitive = false
  value = "${var.ssh_user}"
}
output "ssh_key" {
  sensitive = false
  value     = "${var.ssh_private_key}"
}

output "JDBC" {
  sensitive =false
  value     = "postgresql://yugabyte@${aws_instance.yugabyte_nodes.*.public_ip[0]}:5433"
}

output "YSQL"{
  sensitive = false
  value     = "ysqlsh -U yugabyte -h ${aws_instance.yugabyte_nodes.*.public_ip[0]} -p 5433"
}

output "YCQL"{
  sensitive = false
  value     = "ycqlsh ${aws_instance.yugabyte_nodes.*.public_ip[0]} 9042"
}

output "YEDIS"{
  sensitive = false
  value     = "redis-cli -h ${aws_instance.yugabyte_nodes.*.public_ip[0]} -p 6379"
 }
