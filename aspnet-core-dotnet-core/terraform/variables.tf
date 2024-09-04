variable "tenant_id" {
  description = "The tenant ID"
  default = "ad2043b9-718d-4277-b415-95913108c725"
}

variable "subscription_id" {
  description = "The subscription ID"
  default = "245ce031-cd70-4369-9fe3-b22d7fb8a0f0"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default = "rg-dot-net-aks"
}

variable "location" {
  description = "The Azure location for the resources"
  default     = "North Europe"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  default = "nur-aks-cluster"
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  default = "nuracr"
}

variable "law" {
  description = "The name of the Log Analytics Workspace"
  default = "nurlaw"
}

variable "azurerm_monitor_diagnostic_setting" {
  description = "The name of the Monitoring"
  default = "nur-monitor"
}

variable "azuread_group" {
  description = "The name of the Group"
  default = "Contributing developers"
}