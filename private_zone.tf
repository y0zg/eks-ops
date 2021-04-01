#resource "aws_route53_zone" "private" {
#  name = "test.com"
#
#  vpc {
#    vpc_id = module.vpc.vpc_id
#  }
#}

#resource "aws_route53_record" "kibana" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "kibana.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.elk_server[0].private_ip]
#}

#resource "aws_route53_record" "elasticsearch" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "elasticsearch.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.elk_server[0].private_ip]
#}

#resource "aws_route53_record" "mysql" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "mysql.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.mysql_server[0].private_ip]
#}

#resource "aws_route53_record" "grafana" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "grafana.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.prometheus_server[0].private_ip]
#}

#resource "aws_route53_record" "jenkins" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "jenkins_slave.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.jenkins_slave[0].private_ip]
#}

#resource "aws_route53_record" "bastion" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "bastion.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.bastion[0].private_ip]
#}

#resource "aws_route53_record" "consul_server_1" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "consul_server.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.consul_server[0].private_ip]
#}

#resource "aws_route53_record" "consul_server_2" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "consul_server.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.consul_server[1].private_ip]
#}

#resource "aws_route53_record" "consul_server_slave" {
#  zone_id = aws_route53_zone.private.zone_id
#  name    = "consul_server.${aws_route53_zone.private.name}"
#  type    = "A"
#  ttl     = "60"
#  records = [aws_instance.consul_server[2].private_ip]
#}