terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "2.46.0"
    }

  }
}

provider "azurerm" {
  features {
    
  }
  client_id = "1a0a32de-3b2f-4790-aa90-5e14b8fb7187"
  client_secret ="mxh8Q~x8tYMObvHd7HwfQ2GBePJTXLUiSJWj3auM"
  tenant_id = "31e46a46-0504-4e87-8878-5adea77cdfbe"
  subscription_id ="64db6a2c-2487-4a6f-91f2-ed6b12da00f6"
  
}

terraform {
  backend "azurerm" {
    resource_group_name = "#{ResourceGroupName}#"
    storage_account_name = "#{terraformstorageaccount}#"
    container_name = "con1"
    key = "prod.terraform.state"
    
  }
}

variable "rgname" {}
variable "location" {}
variable "aspname" {}
variable "webappname" {}


module "web_mysql"{
    source = "./modules"
    rgname=var.rgname
    location=var.location
    aspname=var.aspname
    webappname=var.webappname
}
