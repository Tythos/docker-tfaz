variable "resource_group" {
  type        = string
  default     = "example-resources"
  description = "Defines the name of the resource group to be created and managed"
}

variable "location" {
  type        = string
  default     = "centralus"
  description = "Azure region where the resource group and its contents will be instantiated"
}
