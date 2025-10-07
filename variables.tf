variable "globalaccount" {
  description = "The subdomain of the SAP BTP global account."
  type        = string
}

variable "api_url" {
  description = "The API URL for the Cloud Foundry instance."
  type        = string
}

variable "subaccount_id" {
  description = "The ID of the SAP BTP subaccount where resources will be created."
  type        = string
}

variable "org_id" {
  description = "The ID of the Cloud Foundry organization where resources will be created."
  type        = string
}

variable "space_name" {
  description = "The name of the Cloud Foundry space where resources will be created."
  type        = string
}

variable "hana_cloud_admins" {
  description = "List of users to be assigned the SAP HANA Cloud Administrator role."
  type        = list(string)
  default     = []
}

variable "hana_cloud_system_password" {
  description = "The password for the HANA Cloud system user. Needs to be longer than 8 characters."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.hana_cloud_system_password) >= 8 
    error_message = "The HANA Cloud system password must be at least 8 characters long."
  }
}
