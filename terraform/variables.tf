#<><> Environment <><><><><><><><><><><><><><><><><><><><><><><><><><>#
variable "env" {
  description = "Environment (poc,test,stage,preprod,prod,monit)"
  default     = "poc"
}

variable "profile" {
  description = "AWS Profile"
  default     = "mal"
}

variable "account_id" {
  description = "AWS Account ID"
  default     = ""
}

variable "access_key" {
  description = "AWS access key"
  default     = ""
}

variable "secret_key" {
  description = "AWS secret access key"
  default     = ""
}

variable "region" {
  description = "AWS region to host the environment"
  default     = "us-east-1"
}

variable "tags" {
  type = "map"

  default = {
    Application = "Proofing"
    Owner       = "ehimeprefecture"
    Program     = "TechnologyTransformation"
    Project     = "MYA Proofing"
    Role        = "mya"
    Workload    = "My Account"
  }
}

#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>#

