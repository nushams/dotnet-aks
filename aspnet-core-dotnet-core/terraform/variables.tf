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
