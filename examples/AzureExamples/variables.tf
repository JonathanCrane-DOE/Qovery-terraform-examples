variable "rg_location" {
  description = "(Optional) Region where the Azure resources will be created. Defaults to West US 3."
  type        = string
  default     = "westus3"
}

variable "naming_prefix" {
  description = "(Optional) Naming prefix used for resources. Defaults to adsolabs."
  type        = string
  default     = "adsolabs"
}

variable "asp_os_type" {
  description = "(Optional) App Service Plan OS type"
  type        = string
  default     = "Linux"
}

variable "asp_sku_name" {
  description = "(Optional) App Service Plan SKU name"
  type        = string
  default     = "P1v2"
}