# Random Password
resource "random_password" "password" {
  length           = 8
  upper            = false
  special          = false
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.project}-${var.environment}-rg"
  location = var.location
}


resource "azurerm_storage_account" "storage_account" {
  name                     = replace("${var.project}${var.environment}st", "-", "")
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }
}


resource "azurerm_storage_blob" "storage_blob" {
  for_each = fileset("files-to-upload/", "*")
  source   = "files-to-upload/${each.value}"

  name                   = each.value
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_md5            = filemd5("files-to-upload/${each.value}")
  content_type           = endswith(each.value, "html") ? "text/html" : "image/jpg"
}
