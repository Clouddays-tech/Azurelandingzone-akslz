terraform {
  backend "azurerm" {
    storage_account_name = "alzdevopsstg"
    container_name       = "alzdevblob"
    key                  = "application_lz.tfstate"
  }
}

