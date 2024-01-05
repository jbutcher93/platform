variable "environment" {
  type        = string
  description = "project envrionment"
  default     = "test"
}

variable "oralb_graph" {
  type        = string
  description = "Graph ID for Oralb"
  default     = "oralb-gateway-router"
}

variable "oralb_auth_urls" {
  type        = list(string)
  description = "Auth0 URL for Oralb"
  default     = [""]
}

variable "cors_origins_oralb" {
  type        = list(string)
  description = "cors origin URLs for oralb"
  default     = ["http://hello.com"]
}

variable "oralb_apollo_key" {
  type        = string
  description = "Apollo key for oralb"
  default     = ""
}
