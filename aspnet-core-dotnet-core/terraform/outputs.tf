output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "acr_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
# Output the ACR username
output "acr_username" {
  value = azurerm_container_registry.acr.admin_username
}

# Output the ACR password
output "acr_password" {
  value = azurerm_container_registry.acr.admin_password
  sensitive = true
}