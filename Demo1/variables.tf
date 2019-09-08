variable "name" {
  description = "Resource Group used for Ghost ACI demo"
}

variable "environment" {
  description = "Resource Group used for Ghost ACI demo"
}

variable "loc" {
  description = "Region / location to deploy all demo resources into"
}

variable "tags" {
  description = "Tags associated with demo resources"
  default     = {}
}