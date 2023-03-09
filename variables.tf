variable "description" {
  type        = string
  default     = ""
  description = "Vnet description."
}

variable "caf_prefixes" {
  type        = list(string)
  default     = []
  description = "Prefixes to use for caf naming."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "address_spaces" {
  type        = list(string)
  description = "Vnet address space."
}

variable "custom_location" {
  type        = string
  default     = ""
  description = "Custom Location."
}

variable "dns_servers" {
  type        = list(string)
  description = "Custom DNS Servers for the vNet"
  default     = []
}
