terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.61"
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
  account  = "XU93738.australiaeast.azure"
  user     = var.snowflake_user
  password = var.snowflake_password
  role     = "ACCOUNTADMIN"
  region = ""
}