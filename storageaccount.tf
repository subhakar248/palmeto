resource "random_id" "random_id" {
  keepers = {
    # Generate a new id each time when a new resource group is create
    resource_group = azurerm_resource_group.training.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "training" {
  name                     = "tera${random_id.random_id.hex}"
  resource_group_name      = azurerm_resource_group.training.name
  location                 = azurerm_resource_group.training.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
