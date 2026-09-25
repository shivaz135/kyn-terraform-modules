variable "project_name" {
  description = "project name"
  type        = string

}

variable "environment" {
  description = "Environment Name"
  type        = string

}

variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
 
}

variable "location" {
  description = "name of the location"
  type        = string
  
}

variable "vnet_address_space" {
  type    = list(string)

}

variable "web_subnet_address" {
  type    = list(string)

}

variable "tags" {
  type = map(string)
}

