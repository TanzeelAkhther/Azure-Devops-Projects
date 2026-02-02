variable "iam" {
    type = object({
        name = string
        location = string
        resource_group_name = string
    })
}
