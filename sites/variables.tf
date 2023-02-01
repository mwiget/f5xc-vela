variable "project_prefix" {
  type        = string
  default     = "f5xc"
}

variable "owner_tag" {
  type        = string
  default     = "user@email"
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key used to create infrastructure"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key used to create AWS infrastructure"
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

variable "f5xc_namespace" {
  type    = string
  default = "system"
}

variable "ssh_public_key" {
  type = string
}

variable "f5xc_azure_cred" {
  type    = string
}

variable "f5xc_aws_cred" {
  type    = string
}

#variable "VES_P12_PASSWORD" {
#  type    = string
#  description = "required to slience warning in terraform cloud for env var used to decrypt f5xc_api_p12_file"
#}

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

variable "express_route_circuit_id" {
  type = string
  default = ""
}

