variable "network" {
  type = object({
    vnet_name             = string
    resource_group_name   = string
    location              = string
    vnet_address_space    = list(string)
    subnet_name           = string
    subnet_address_prefix = list(string)
    tags                  = map(string)
  })
}
