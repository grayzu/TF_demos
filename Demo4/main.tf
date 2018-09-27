module "routetable" {
  source              = "demo-module"
  
  resource_group_name = "myapp"
  location            = "westus"
  route_prefixes      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  route_nexthop_types = ["VnetLocal", "VnetLocal", "VnetLocal"]
  route_names         = ["route1", "route2", "route3"]

  tags = {
    environment = "demo"
    costcenter  = "devops"
  }
}