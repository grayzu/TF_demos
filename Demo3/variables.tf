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

variable "sqladmin" {
  description = "Name for MySQL administrator account"
  default       = "root"
}

variable "sqlpwd" {
  description = "Password for MySQL administrator account"
  default       = "aC00lSQLPa$$word"
}

variable "mysql" {
  description = "MySQL Server instance name"
  default       = "mysqlserver"
}

variable "dbname" {
  description = "Name of the MySQL database to be used by Ghost"
  default       = "ghostdb"
}