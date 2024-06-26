terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.63"
    }
  }
  backend "remote" {
    organization = "snow-tfc-github-org"

    workspaces {
      name = "snow-dev"
    }
  }
}

provider "snowflake" {
  account  = var.snowflake_acct
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = "ACCOUNTADMIN"
  region = "australiaeast.azure"
}