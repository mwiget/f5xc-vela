variable "project_prefix" {
  type        = string
  default     = "f5xc"
}

variable "deployment" {
  type        = string
  default     = "f5xc"
}

variable "fqdn" {
  type        = string
  default     = "domain.corp"
}

variable "f5xc_namespace" {
  type        = string
  default     = "noname"
}

variable "owner_tag" {
  type        = string
  default     = "m.wiget@f5.com"
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key used to create infrastructure"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key used to create AWS infrastructure"
}

variable "ssh_public_key" {
  type        = string
}

variable "f5xc_api_p12_file" {
  type = string
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_tenant" {
  type = string
}

variable "azure_subscription_id" {
  type        = string
  default     = ""
} 

variable "azure_tenant_id" {
  type        = string
  default     = ""
} 

variable "azure_client_id" {
  type        = string
  default     = ""
} 

variable "azure_client_secret" {
  type        = string
  default     = ""
} 

variable "fcos_vm_template" {
  type        = string
  default     = ""
}
variable "guest_type" {
  type        = string
}
variable "vsphere_server" {
  type = string
  default = ""
}
variable "vsphere_user" {
  type = string
  default = "administrator@vsphere.local"
}
variable "vsphere_password" {
  type = string
  default = ""
}
variable "vsphere_datacenter" {
  type = string
  default = ""
}
variable "vsphere_cluster" {
  type = string
  default = ""
}
variable "vsphere_datastore" {
  type = string
  default = "datastore1"
}
