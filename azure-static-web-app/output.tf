# output "resource_group_id" {
#   value = azurerm_resource_group.resource_group.id
# }


output "password_bcrypt_hash" {
  sensitive = true
  value     = random_password.password.bcrypt_hash
}

output "password_bcrypt_id" {
  value = random_password.password.id
}

output "password_bcrypt_result" {
  sensitive = true
  value     = random_password.password.result
}

# output "static_app_site_id" {
#   value = azurerm_static_site.static_site.id
# }

output "static_app_site_api_key" {
  sensitive = true
  value     = azurerm_static_site.static_site.api_key
}

output "static_app_site_default_host_name" {
  value = azurerm_static_site.static_site.default_host_name
}

output "static_app_site_identity" {
  value = azurerm_static_site.static_site.identity
}
