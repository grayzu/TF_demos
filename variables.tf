variable "rg" {
    description             = "Resource Group used for Ghost ACI demo"
}

variable "loc" {
    description             = "Region / location to deploy all demo resources into"
}

variable "tags" {
    description             = "Tags associated with demo resources"
    default                 = {}
}

variable "sqladmin" {
    description             = "Name for MySQL administrator account"
}

variable "sqlpwd" {
    description             = "Password for MySQL administrator account"
}

variable "mysql" {
    description             = "MySQL Server instance name"
}