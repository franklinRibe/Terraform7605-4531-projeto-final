############# Variables BE Service and HC #############

variable "be_service_name" {
  type        = string
  description = "Valor do nome do BE Service"
  default     = "lb-20201211-be"
}

variable "backend_health_check_name" {
  type        = string
  description = "Valor do nome do Health Check Service"
  default     = "lb-20201211-hc"
}

variable "hc_request_path" {
  type        = string
  description = "Valor padrão para request path do HC"
  default     = "/"
}

variable "hc_check_interval" {
  type        = number
  description = "Valor do nome do intervalo Health Check Service"
  default     = 20
}

variable "hc_timeout" {
  type        = number
  description = "Valor do nome do timeout Health Check Service"
  default     = 10
}

variable "urlmap-name" {
  type        = string
  description = "Nome do urlmap"
  default     = "urlmap"
}

variable "target-proxy" {
  type        = string
  description = "teste"
  default     = "target-proxy"

}

variable "backend_ports" {
  type        = string
  description = "teste"
  default     = "80"

}

variable "backend_port_name" {
  type    = string
  default = "http"

}

variable "backend_protocol" {
  type    = string
  default = "HTTP"
}

variable "backend_timeout_sec" {
  type    = number
  default = 10
}

############# END variables BE Service and HC #############
variable "forwarding" {
  type    = string
  default = "forwarding"
}



############ VARIABLES VPC

variable "icmp" {
  type    = string
  default = "icmp"
}

variable "auto_create_subnetworks" {
  type    = bool
  default = false
}

variable "vpc_name" {
  default = "vpc"
}

variable "subname" {
  default = "usnet"
}

variable "iprange" {
  default = "192.168.10.0/24"
}

variable "region" {
  default = "us-central1"
}

variable "fw-name" {
  default = "fw-web"
}

variable "protocol" {
  default = "tcp"
}

variable "ports" {
  default = ["80", "443", "22"]
}

variable "sources" {
  default = ["0.0.0.0/0"]
}

variable "tags" {
  default = ["web", "ssh"]
}

############### variables instance template

variable "name_template" {
  type    = string
  default = "f1-micro"
}
variable "description_template" {
  type    = string
  default = "f1-micro"
}
variable "template_tags" {
  type    = list(any)
  default = ["ubuntu"]
}
variable "machine_type" {
  type    = string
  default = "f1-micro"
}

variable "maintenance" {
  type    = string
  default = "MIGRATE"
}

variable "can_ip_forward" {
  type    = bool
  default = false
}

variable "automatic_restart" {
  type    = bool
  default = true
}

variable "os_image" {
  type    = string
  default = "ubuntu-1804-lts"
}

variable "disk_boot" {
  type    = bool
  default = true
}

variable "disk_delete" {
  type    = bool
  default = true
}

variable "script" {
  type    = string
  default = "sudo apt-get update -y && sudo apt-get install nginx -y"
}

variable "ssh_pub_key" {
  type    = string
  default = "fribeiro:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9uYBWftQDm8HssI28rsx1lLvmBCbfF/MOVDoULTAlpvEc+jqVQ0/E/Ti1MZinZKxOz43zxA6MF/CNY7qZkDHQUp4/PE8P5USMPGcPAGA+MhN7UE1cZ7Ylbq2L2t+Zdkw43oBWCDanP+G2PzT3UomTseWE9JRvVboJ435kmnRgC3fOPUn5A3tPwj/5jpAXmb/4CvfFuIFc2HqzpfNIA4PcPa48HZfzGoQDu1pZEYyHw5LLX8JfKo79UzY/N75KBYarQ9g4OTai08JE7idxBcsn9aE29RM+EoHTdbbMo6He19ZRRnrNZQXbwO3InbHEs/BaOHwynvpXQsEm4M8gp6rT fribeiro@debian"
}

##################### Auto Escaler ####################

variable "autoscaler_name" {
  type    = string
  default = "autoscaler"
}

variable "max_replicas" {
  type    = number
  default = 10
}

variable "min_replicas" {
  type    = number
  default = 3
}

variable "cooldown_period" {
  type    = number
  default = 60
}

variable "cpu_utilization" {
  type    = number
  default = 0.6
}

################## Instance Group ###########

variable "instance_group_name" {
  type    = string
  default = "app-group"
}


variable "base_instance_name" {
  type    = string
  default = "app"
}

variable "policy_zones" {
  type    = list(any)
  default = ["us-central1-a", "us-central1-b", "us-central1-c"]
}

variable "auto_healing_delay_sec" {
  type    = number
  default = 300
}

##################### Health Check

variable "health_check_name" {
  type    = string
  default = "autohealing-health-check"
}

variable "check_interval_sec" {
  type    = number
  default = 5
}

variable "timeout_sec" {
  type    = number
  default = 5
}

variable "healthy_threshold" {
  type    = number
  default = 2
}

variable "unhealthy_threshold" {
  type    = number
  default = 10
}

variable "http_health_path" {
  type    = string
  default = "/"
}

variable "http_health_port" {
  type    = string
  default = "80"
}


###### 