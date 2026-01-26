variable "acr" {
    type = object ({
        name = string
        resource_group_name = string
        location = string
        sku = string
        admin_enabled = bool
        tags = map(string)
    })
}