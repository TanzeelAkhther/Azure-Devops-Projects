rg = {
  name     = "rg-aks-dev"
  location = "centralindia"
  tags = {
    environment = "dev"
  }
}

network = {
  vnet_name             = "vnet-aks-dev"
  resource_group_name   = "rg-aks-dev"
  location              = "centralindia"
  vnet_address_space    = ["10.0.0.0/16"]
  subnet_name           = "subnet-aks-dev"
  subnet_address_prefix = ["10.0.1.0/24"]
  tags = {
    environment = "dev"
  }
}

acr = {
  name                = "acakdev09"
  resource_group_name = "rg-aks-dev"
  location            = "centralindia"
  sku                 = "Basic"
  admin_enabled       = false
  tags = {
    environment = "dev"
  }
}

aks_identity = {
  name = "identity-aks-dev"
}

aks = {
  name               = "aks-dev-cluster"
  kubernetes_version = "1.33.5"
  dns_prefix         = "aksdevcluster"
  default_node_pool = {
    name       = "def-pool"
    vm_size    = "Standard_D2s_v3"
    node_count = 2
  }
  network_profile = {
    service_cidr   = "10.1.0.0/24"
    dns_service_ip = "10.1.0.10"
  }
}

keyvault = {
  name     = "kv-reddit-dev-001"
  sku_name = "standard"
}

# Remove password from postgresql block

postgresql = {
  name                  = "postgres-reddit-dev"
  version               = "15"
  administrator_login        = "pgadmin"
  administrator_password = "placeholder-will-be-overridden"
  storage_mb            = 32768
  sku_name              = "B_Standard_B1ms"
  backup_retention_days = 7
  database_name         = "reddit_clone"
  tags = {
    environment = "dev"
  }
}