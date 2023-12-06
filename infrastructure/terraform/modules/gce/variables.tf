variable "instance_name" {
  type        = string
  description = "Name of compute engine instance"
}

variable "firewall_rule_name" {
  type        = string
  description = "Name of firewall rule"
}

variable "startup_script_location" {
  type        = string
  description = "Path to startup script"
}
