variable "iam" {
    description = "IAM configuration for the AKS cluster"
    type = object ({
        aks_principal_id = string
        acr_id = string
        role_name = optional(string, "AcrPull")
    })
}