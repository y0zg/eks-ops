resource "aws_elb" "kibana" {
  name = "kibana" 
  
  subnets = [module.vpc.public_subnet_ids[0], module.vpc.public_subnet_ids[1]]
  security_groups = [aws_security_group.log_sg.id]


  listener {
    instance_port     = 5601
    instance_protocol = "http"
    lb_port           = 5601
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 3
    target              = "TCP:5601"
    interval            = 30
  }
  
  instances                   = aws_instance.elk_server.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  

}

resource "aws_elb" "prometheus" {
  name = "prometheus" 
  
  subnets = [module.vpc.public_subnet_ids[0], module.vpc.public_subnet_ids[1]]
  security_groups = [aws_security_group.monitor_sg.id]


  listener {
    instance_port     = 9090
    instance_protocol = "http"
    lb_port           = 9090
    lb_protocol       = "http"
  }
  listener {
    instance_port     = 3000
    instance_protocol = "http"
    lb_port           = 3000
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 3
    target              = "TCP:9090"
    interval            = 30
  }
  
  instances                   = aws_instance.prometheus_server.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  

}

resource "aws_elb" "consul_server" {
  
  name = "cosnul-server" 
  subnets = [module.vpc.public_subnet_ids[0], module.vpc.public_subnet_ids[1]]
  security_groups = [aws_security_group.kandula_consul.id]


  listener {
    instance_port     = 8500
    instance_protocol = "http"
    lb_port           = 8500
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 3
    target              = "TCP:8500"
    interval            = 30
  }
  
  instances                   = aws_instance.consul_server.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  

}

resource "aws_elb" "jenkins_master" {
 
  name = "jenkins-master" 
  subnets = [module.vpc.public_subnet_ids[0], module.vpc.public_subnet_ids[1]]
  security_groups = [aws_security_group.jenkins_master.id]


  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 3
    target              = "TCP:8080"
    interval            = 30
  }
  
  instances                   = aws_instance.jenkins_master.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  

}
